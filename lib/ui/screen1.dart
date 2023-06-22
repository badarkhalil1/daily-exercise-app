import 'dart:math';
import 'package:daily_exercise/auth/signup.dart';
import 'package:daily_exercise/backend_bmi/age_weight_widget.dart';
import 'package:daily_exercise/backend_bmi/gender_widget.dart';
import 'package:daily_exercise/ui/about_us.dart';
import 'package:daily_exercise/ui/diet_plan.dart';
import 'package:daily_exercise/ui/excercise.dart';
import 'package:daily_exercise/ui/height_screen.dart';
import 'package:daily_exercise/ui/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key, }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          actions: [
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Signup()));
              },
              child: Row(
                children: [
                  const Text(
                    'Log_out',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(Icons.logout)
                ],
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children:  [
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/abs.jpeg'),fit: BoxFit.cover)
                  ),
                  accountName: Text('Daily Exercise',style: TextStyle(
                      fontSize: 25
                  ),),
                  accountEmail: Text('xyz@gmail.com',style: TextStyle(
                      fontSize: 20
                  ),)),
              ListTile(
                title: Text(
                  'Excercises',
                  style: TextStyle(fontSize: 20),
                ),onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Excercise_Screen1()));
              },
                leading: Icon(Icons.expand_circle_down_outlined),
                textColor: Colors.black,
                iconColor: Colors.red,
              ),
              ListTile(
                title: Text(
                  'Diet_Plan',
                  style: TextStyle(fontSize: 20),
                ),onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Diet_plan1()));
              },
                leading: Icon(Icons.next_plan_outlined),
                textColor: Colors.black,
                iconColor: Colors.red,
              ),
              ListTile(
                title: Text(
                  'About Us',
                  style: TextStyle(fontSize: 20),
                ),onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>About_us()));
              },
                leading: Icon(Icons.contact_page_rounded),
                textColor: Colors.black,
                iconColor: Colors.red,
              ),
              ListTile(
                title: Text(
                  'Log out',
                  style: TextStyle(fontSize: 20),
                ),onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
              },
                leading: Icon(Icons.logout),
                textColor: Colors.black,
                iconColor: Colors.red,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                children: [
                  //Lets create widget for gender selection
                  GenderWidget(
                    onChange: (genderVal) {
                      _gender = genderVal;
                    },
                  ),
                  HeightWidget(
                    onChange: (heightVal) {
                      _height = heightVal;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgeWeightWidget(
                          onChange: (ageVal) {
                            _age = ageVal;
                          },
                          title: "Age",
                          initValue: 30,
                          min: 0,
                          max: 100),
                      AgeWeightWidget(
                          onChange: (weightVal) {
                            _weight = weightVal;
                          },
                          title: "Weight(Kg)",
                          initValue: 50,
                          min: 0,
                          max: 200)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60),
                    child: SwipeableButtonView(
                        isFinished: _isFinished,
                        onFinish: () async {
                          await Navigator.push(
                              context,
                              PageTransition(
                                  child: ScoreScreen(
                                    bmiScore: _bmiScore,
                                    age: _age,
                                  ),
                                  type: PageTransitionType.fade));

                          setState(() {
                            _isFinished = false;
                          });
                        },
                        onWaitingProcess: () {
                          //Calculate BMI here
                          calculateBmi();

                          Future.delayed(const Duration(seconds: 1), () {
                            setState(() {
                              _isFinished = true;
                            });
                          });
                        },
                        activeColor: Colors.blue,
                        buttonWidget: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                        buttonText: "CALCULATE"),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
