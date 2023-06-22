import 'dart:async';
import 'package:daily_exercise/auth/login.dart';
import 'package:daily_exercise/ui/screen1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Splash_Screen extends StatefulWidget {
  static const String id = 'Splash_Screen';
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    if(user != null){
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      });
    }else{
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/splash.png'
            )),
      ),
    );
  }
}
