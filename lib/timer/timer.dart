import 'package:daily_exercise/timer/countdown-page.dart';
import 'package:flutter/material.dart';
class Timer_exer extends StatefulWidget {
  const Timer_exer({Key? key}) : super(key: key);

  @override
  State<Timer_exer> createState() => _Timer_exerState();
}

class _Timer_exerState extends State<Timer_exer> {
  @override
  Widget build(BuildContext context) {
    return CountdownPage();
  }
}
