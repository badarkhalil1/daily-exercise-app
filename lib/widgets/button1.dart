import 'package:flutter/material.dart';
class Button1 extends StatelessWidget {
  static const String id = 'Button';
  final String title;
  final VoidCallback ontap;
  final bool loading;
  const Button1({Key? key,
    required this.title,
    required this.ontap,
    this.loading=false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(child: loading? CircularProgressIndicator(strokeWidth: 3, color: Colors.white, ):
          Text(title,style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontStyle: FontStyle.italic,
          ),)),

        ),
      ),
    );
  }
}
