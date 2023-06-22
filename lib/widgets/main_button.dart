import 'package:flutter/material.dart';
class Main_button extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String text;
  final Color color;

  const Main_button({Key? key,
    required this.title,
    required this.text,
    required this.onTap,
    required this.color,

  
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
        ),
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(title,style: TextStyle(
                fontSize: 25,
              ),),
              SizedBox(height: 7,),
              Text(text,style: TextStyle(
                fontSize: 20
              ),)
            ],
          ),
        ),
      ),
    );
  }
}

