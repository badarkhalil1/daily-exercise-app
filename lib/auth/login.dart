
import 'dart:ui';

import 'package:daily_exercise/auth/login_with_number.dart';
import 'package:daily_exercise/auth/signup.dart';
import 'package:daily_exercise/ui/screen1.dart';
import 'package:daily_exercise/utility/utils.dart';
import 'package:daily_exercise/widgets/button1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Login extends StatefulWidget {
  static const String id = 'Login';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading= false;
  final _formfiled = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  void login(){
    _auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString())
        .then((value){
          setState(() {
            loading= true;
          });
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      utils().toastmessage(value.user.toString());
          setState(() {
            loading= false;
          });

    })
        .onError((error, stackTrace){
      debugPrint(error.toString());
      setState(() {
        loading= false;
      });
      utils().toastmessage(error.toString());

    });
  }
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(child: Text('Daily Exercise')),
          ),
          body: 
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/bg1.jpg'),fit: BoxFit.cover)
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                        key: _formfiled,
                        child: Column(
                          children: [
                            TextFormField(
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              style: TextStyle(color: Colors.white),

                              decoration: InputDecoration(
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
                            SizedBox(height: 30,),
                            TextFormField(
                              controller: passwordController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock,color: Colors.white,),
                                hintText: 'Password',hintStyle: TextStyle(
                                color: Colors.white
                              )
                              ),cursorColor: Colors.white,
                              obscureText: true,

                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter pasword';
                                }return null;
                              },
                            ),
                          ],
                        )),
                    SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Center(child: Button1
                      (
                        title:'Login',
                        ontap: (){
                          if(_formfiled.currentState!.validate()){
                            login();
                          };
                        },

                      )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dont't have an account?",style: TextStyle(
                          color: Colors.white.withOpacity(0.9)
                        ),),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                        },
                            child: Text('Sign up',style: TextStyle(
                              color: Colors.teal.shade200
                            ),)),

                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Center(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Loginwithnumber()
                              ));

                            },
                            child: Container(
                              height: 40,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.black
                                  )
                              ),
                              child: Center(
                                child: Text('Login with phone number',style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20
                                ),),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
          ),
          )
    );
  }
}
