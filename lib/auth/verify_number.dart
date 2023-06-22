
import 'package:daily_exercise/ui/screen1.dart';
import 'package:daily_exercise/utility/utils.dart';
import 'package:daily_exercise/widgets/button1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Verifynumber extends StatefulWidget {
  final String verification;
  const Verifynumber({Key? key,
    required this.verification,
  }) : super(key: key);

  @override
  State<Verifynumber> createState() => _VerifynumberState();
}

class _VerifynumberState extends State<Verifynumber> {
  final verifynumbercontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('verify with Number'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/bg1.jpg'),fit: BoxFit.fill)
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
                    controller: verifynumbercontroller,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: '6 digits Code',hintStyle: TextStyle(
                      color: Colors.white
                    )
                    ),
                  ),

                ),

              ),
              SizedBox(height: 50,),
              Button1(title: 'verify',loading: loading, ontap: ()async{
                setState(() {
                  loading= true;
                });
                final credential = PhoneAuthProvider.credential(
                  verificationId: widget.verification,
                  smsCode: verifynumbercontroller.text.toString(),
                );
                try{
                  await auth.signInWithCredential(credential);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                }catch(e){
                  setState(() {
                    loading= false;
                  });
                  utils().toastmessage(e.toString());
                };
              })
            ],
          ),
        ),
      ),
    );
  }
}
