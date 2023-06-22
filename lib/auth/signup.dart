import 'dart:ui';
import 'package:daily_exercise/auth/login.dart';
import 'package:daily_exercise/utility/utils.dart';
import 'package:daily_exercise/widgets/button1.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Signup extends StatefulWidget {
  static const String id = 'Signup';
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool loading= false;
  final _formfiled = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  void signup(){
    if(_formfiled.currentState!.validate()){
      setState(() {
        loading = true;
      });
      _auth.createUserWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString()).then((value){
        setState(() {
          loading = false;
        });
      }).onError((error, stackTrac){
        utils().toastmessage(error.toString());
        setState(() {
          loading = false;
        });
      });
    } }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Your Account'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/bg1.jpg'
                ),fit: BoxFit.fill)
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                    key: _formfiled,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          style: TextStyle(color: Colors.white),

                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email,color: Colors.white,),
                              hintText: 'Email',hintStyle: TextStyle(
                            color: Colors.white
                          )
                          ),

                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter Email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30,),
                        TextFormField(
                          controller: passwordController,
                          style: TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock,color: Colors.white,),
                            hintText: 'Password',hintStyle: TextStyle(
                            color: Colors.white
                          )
                          ),
                          obscureText: true,

                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter pasword';
                            }return null;
                          },
                        ),

                      ],
                    )),
                const SizedBox(height: 32,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(child: Button1(
                    loading: loading,
                    title:'Sign up',
                    ontap: (){
                      signup();
                    },

                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",style: TextStyle(
                      color: Colors.white
                    ),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                    },
                        child: const Text('Log In',style: TextStyle(
                        ),))
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
