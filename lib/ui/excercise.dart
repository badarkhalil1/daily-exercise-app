import 'package:daily_exercise/ui/advance/abs_advance.dart';
import 'package:daily_exercise/ui/advance/acrobatic.dart';
import 'package:daily_exercise/ui/advance/core_advance.dart';
import 'package:daily_exercise/ui/advance/hands.dart';
import 'package:daily_exercise/ui/advance/shoulders.dart';
import 'package:daily_exercise/ui/beginner/abs_begginer.dart';
import 'package:daily_exercise/ui/beginner/cardio_beginner.dart';
import 'package:daily_exercise/ui/beginner/core_beginner.dart';
import 'package:daily_exercise/ui/beginner/yoga_begginer.dart';
import 'package:daily_exercise/ui/intermediate/abs_inter.dart';
import 'package:daily_exercise/ui/intermediate/cardio_inter.dart';
import 'package:daily_exercise/ui/intermediate/core_inter.dart';
import 'package:daily_exercise/ui/intermediate/streaching.dart';
import 'package:daily_exercise/ui/intermediate/upperbody_inter.dart';
import 'package:daily_exercise/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:daily_exercise/ui/beginner/upper_body.dart';
class Excercise_Screen1 extends StatefulWidget {
  const Excercise_Screen1({Key? key}) : super(key: key);

  @override
  State<Excercise_Screen1> createState() => _Excercise_Screen1State();
}

class _Excercise_Screen1State extends State<Excercise_Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                title:  Text('     Daily Exercise'),
                background: Image(image: AssetImage('assets/images/exercisesss.gif'),fit: BoxFit.cover,)
              ),
              expandedHeight: 300,
              centerTitle: true,
            ),
            SliverAppBar(
              backgroundColor: Colors.red,
              automaticallyImplyLeading: false,
              title: Align(
                alignment: AlignmentDirectional.center,
                child: TabBar(
                  indicatorColor: Colors.black,
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'Beginner',),
                    Tab(text: 'Intermediate',),
                    Tab(text: 'Advance',),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
                  height:MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TabBarView(
                    children:[
                      SingleChildScrollView(
                        child:
                        Container(
                         child: Column(
                           children: [
                             Main_button(
                                 color: Colors.grey.shade400,
                                 title: 'Yoga',
                                 text: '3exercises,1min',
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Yoga_begginer()));},
                             ),
                             Main_button(
                                 title: 'Core',
                                 text: '3exercises,1min',
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Core_beginner()));
                                 },
                                 color: Colors.yellowAccent),
                             Main_button(
                                 title: 'Cardio',
                                 text: '3exercises,1min',
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardio_begginer()));
                                 },
                                 color: Colors.black54),
                             Main_button(
                                 title: 'Upper Body',
                                 text: '4exercises,4min',
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=> upperBody_beginner()));
                                 },
                                 color: Colors.redAccent),
                             Main_button(
                                 title: 'Abs',
                                 text: '5exercises,5min',
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Abs_beginner()));
                                 },
                                 color: Colors.greenAccent),


                               ],
                         ),
                     ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              Main_button(
                                  title: 'Streaching',
                                  text: '4exercises,8min',
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>streaching()));
                                  },
                                  color: Colors.lime.shade400),
                              Main_button(
                                  title: 'Core',
                                  text: '5exercises,10min',
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Core_inter()));
                                  },
                                  color: Colors.redAccent.shade200),

                              Main_button(
                                  title: 'Cardio',
                                  text: '6exercises,12min',
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardio_inter()));
                                  },
                                  color: Colors.teal),
                              Main_button(
                                  title: 'Upper Body',
                                  text: '5exercises,10 min',
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>upperBody_inter()));
                                  },
                                  color: Colors.orangeAccent),
                              Main_button(
                                  title: 'Abs',
                                  text: '5exercises,10 min',
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Abs_inter()));
                                  },
                                  color: Colors.deepPurple.shade300)

                            ],
                          ),
                        ) ,
                      ),
                      SingleChildScrollView(
                        child: Container(
                         child: Column(
                           children: [
                             Main_button(
                                 title: 'Core',
                                 text: '7exercises,14min',
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Core_advance()));
                                 },
                                 color: Colors.lightBlue.shade400),
                             Main_button(
                                 title: 'Acrobatic',
                                 text: '4exercises,12min',
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Acrobatic()));
                                 },
                                 color: Colors.lightGreen),

                             Main_button(
                                 title: 'Hands',
                                 text: '5exercises,10min',
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>hands()));
                                 },
                                 color: Colors.deepOrangeAccent),
                             Main_button(
                                 title: 'Abs',
                                 text: '6exercises,12 min',
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Abs_advance()));
                                 },
                                 color: Colors.pink.shade200),
                             Main_button(
                                 title: 'Shoulders',
                                 text: '7exercises,14min',
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>shoulders()));
                                 },
                                 color: Colors.brown.shade200),


                           ],
                         ),
                     ),
                      ),

                    ]),
                  ),
                ),
              ),

          ],
        ),
      )

    );
  }
}

