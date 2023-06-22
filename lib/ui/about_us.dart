import 'package:flutter/material.dart';
class About_us extends StatefulWidget {
  const About_us({Key? key}) : super(key: key);

  @override
  State<About_us> createState() => _About_usState();
}

class _About_usState extends State<About_us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        title: Center(child: Text('About Us')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.teal.shade100,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 7,
                      spreadRadius: 5,
                      offset: Offset(0,3)
                  )
                ]
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Developer 1:',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text('Badar Khalil',style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),
                Text('Contact#   +923090313010',style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),
                Text('Email#   Badarkhalil12345@gmail.com',style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),
                Text('Location#   Multan,Punjab Pakistan',style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
        ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 7,
                            spreadRadius: 5,
                            offset: Offset(0,3)
                        )
                      ]
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Developer 2:',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      Text('Asad Ullah Sattar',style: TextStyle(fontSize: 20),),
                      SizedBox(height: 20,),
                      Text('Contact#   +923000217820',style: TextStyle(fontSize: 20),),
                      SizedBox(height: 20,),
                      Text('Email#   asadullah782078@gmail.com',style: TextStyle(fontSize: 20),),
                      SizedBox(height: 20,),
                      Text('Location#   Multan,Punjab Pakistan',style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}