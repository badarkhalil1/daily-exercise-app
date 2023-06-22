
import 'package:daily_exercise/auth/verify_number.dart';
import 'package:daily_exercise/utility/utils.dart';
import 'package:daily_exercise/widgets/button1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginwithnumber extends StatefulWidget {
  const Loginwithnumber({Key? key}) : super(key: key);

  @override
  State<Loginwithnumber> createState() => _LoginwithnumberState();
}

class _LoginwithnumberState extends State<Loginwithnumber> {
  final phonenumbercontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg1.jpg'),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Container(
                child: TextFormField(
                  controller: phonenumbercontroller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: '+92 300 1234567',helperStyle:
                  TextStyle(color: Colors.white)
                  ),
                ),
                color: Colors.white,

              ),

            ),
            SizedBox(height: 50,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Button1(title: 'Login',loading: loading, ontap: (){
                  setState(() {
                    loading=true;
                  });
                  auth.verifyPhoneNumber(
                      phoneNumber: phonenumbercontroller.text,
                      verificationCompleted: (_){
                        setState(() {
                          loading=false;
                        });
                      },
                      verificationFailed: (e){
                        setState(() {
                          loading=false;
                        });
                        utils().toastmessage(e.toString());
                      },
                      codeSent: (String verification, int? Token){
                        setState(() {
                          loading=false;
                        });

                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Verifynumber(
                          verification: verification,
                        )));
                      },
                      codeAutoRetrievalTimeout: (e){
                        setState(() {
                          loading=false;
                        });
                        utils().toastmessage(e.toString());
                      }
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
