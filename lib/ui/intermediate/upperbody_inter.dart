import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily_exercise/timer/timer.dart';
import 'package:flutter/material.dart';

class upperBody_inter extends StatefulWidget {
  const upperBody_inter({Key? key}) : super(key: key);

  @override
  State<upperBody_inter> createState() => _upperBody_interState();
}

class _upperBody_interState extends State<upperBody_inter> {

  final List<String> imagelist=[
    'assets/upper_body/side-lateral-raise.gif',
    'assets/upper_body/pulup.gif',
    'assets/upper_body/hammer-curl.gif',
    'assets/upper_body/bicep.gif',
    'assets/upper_body/Dumbbell-Bench-Press.gif',
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('upper-body'),
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
                      ' Tap on timer to set 2 min for each \n  exercise ',style: TextStyle(
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


