import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily_exercise/timer/timer.dart';
import 'package:flutter/material.dart';

class Yoga_begginer extends StatefulWidget {
  const Yoga_begginer({Key? key}) : super(key: key);

  @override
  State<Yoga_begginer> createState() => _Yoga_begginerState();
}

class _Yoga_begginerState extends State<Yoga_begginer> {

  final List<String> imagelist=[
    'assets/yoga/treepose.jpeg',
    'assets/yoga/facedown.gif',
    'assets/yoga/balasana.gif',
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Yoga'),
      ),
      body: SingleChildScrollView(
        child:
        Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(20),
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: 300,
                    autoPlay: false,
                    reverse: false,
                  ),
                    itemCount: imagelist.length,
                    itemBuilder: (context,i,id){
                    return GestureDetector(
                      onTap: (){
                        var img = imagelist[i];

                      },
                      child: Container(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(imagelist[i],
                            width: 500,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                      ),
                    );
                    },

                )

              ),
              SizedBox(height: 10,),
             Container(
               height: 250,
               width: 300,
               child: Timer_exer(),
             ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      ' Tap on timer to set 20 sec for each \n  exercise ',style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}


