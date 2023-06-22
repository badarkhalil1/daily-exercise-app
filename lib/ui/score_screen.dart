import 'package:daily_exercise/auth/signup.dart';
import 'package:daily_exercise/ui/about_us.dart';
import 'package:daily_exercise/ui/diet_plan.dart';
import 'package:daily_exercise/ui/excercise.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiScore;

  final int age;

  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  ScoreScreen({Key? key, required this.bmiScore, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Score"),
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
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Your Score",
                      style: TextStyle(fontSize: 30, color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrettyGauge(
                      gaugeSize: 300,
                      minValue: 0,
                      maxValue: 40,
                      segments: [
                        GaugeSegment('UnderWeight', 18.5, Colors.red),
                        GaugeSegment('Normal', 6.4, Colors.green),
                        GaugeSegment('OverWeight', 5, Colors.orange),
                        GaugeSegment('Obese', 10.1, Colors.pink),
                      ],
                      valueWidget: Text(
                        bmiScore.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 40),
                      ),
                      currentValue: bmiScore.toDouble(),
                      needleColor: Colors.blue,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiStatus!,
                      style: TextStyle(fontSize: 20, color: bmiStatusColor!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiInterpretation!,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Re-calculate")),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Share.share(
                                  "Your BMI is ${bmiScore.toStringAsFixed(1)} at age $age");
                            },
                            child: const Text("Share")), const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Excercise_Screen1() ));
                            },
                            child: const Text("Next")),
                      ],
                    )
                  ]))),
    );
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, You are fit";
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor = Colors.red;
    }
  }
}
