import 'package:daily_exercise/ui/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyDAeYdkt--iTCMhFcKyQBBoGPZTJFj0pgY',
          appId: '1:1047206681325:web:597377fb1339412cf20ae4',
          messagingSenderId: '1047206681325',
          projectId: 'fitness-2b486',
          storageBucket: 'fitness-2b486.appspot.com',
      )
    );
  }else{
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),color: Colors.white,
      home: Splash_Screen(
      ),
    );

  }
}

