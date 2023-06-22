import 'package:flutter/material.dart';
class Diet_plan1 extends StatefulWidget {
  const Diet_plan1({Key? key}) : super(key: key);

  @override
  State<Diet_plan1> createState() => _Diet_plan1State();
}

class _Diet_plan1State extends State<Diet_plan1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
                background: Image(image: AssetImage('assets/images/dietgif.gif'),fit: BoxFit.cover,)
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
                  Tab(text: 'Normal',),
                  Tab(text: 'Under-weight',),
                  Tab(text: 'Over-weight',),
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
                          child:
                          Column(
                            children: [
                              Container(
                                height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.black,
                                  child: Center(child: Text('Healthy Eating Plan',style: TextStyle(fontSize: 25,color: Colors.lime),))),
                              SizedBox(height: 10,),
                              Container(
                                height: 100,
                                child: Image(image: AssetImage('assets/images/normaldiet.png'),fit: BoxFit.cover,),),
                              Container(
                                height: 300,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(color: Colors.green),
                                child: Text('-> Emphasizes vegetables, fruits, whole grains, and fat-free or low-fat dairy products\n'
                                    '\n -> Includes lean meats, poultry, fish, beans, eggs, and nuts\n'
                                    '\n-> Limits saturated and trans fats, sodium, and added sugars\n'
                                    '\n-> Controls portion sizes',style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22
                                ),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(

                        child:
                        Container(
                          child:
                          Column(
                            children: [
                              Container(
                                height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.black,
                                  child: Center(child: Text('How much should an under weight person eat?',style: TextStyle(fontSize: 20,color: Colors.lime),))),
                              SizedBox(height: 5,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text('If you are under weight, you will typically want to consume an additional 500 calories per day. To do this, you might eat extra meals or increase the size of the meals you usually eat.',style: TextStyle(
                                  fontSize: 20
                                ),),),
                              SizedBox(height: 5,),
                              Container(
                                height: 200,
                                child: Image(image: AssetImage('assets/images/Underweight.jpg'),fit: BoxFit.cover,),),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(color: Colors.green),
                                child: const Text('-> Eating at least 5 portions of a variety of fruit and vegetables every day.\n'
                                    '\n -> Basing meals on potatoes, bread, rice, pasta or other starchy carbohydrates\n'
                                    '\n-> Having some dairy or dairy alternatives (such as soya drinks and yoghurts)\n'
                                    '\n-> Eating some beans, pulses, fish, eggs, meat and other protein',style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22
                                ),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(

                        child:
                        Container(
                          child:
                          Column(
                            children: [
                              Container(
                                height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.black,
                                  child: Center(child: Text('Choose minimally processed, whole foods',style: TextStyle(fontSize: 20,color: Colors.lime),))),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text('-> Whole grains (whole wheat, steel cut \n oats, brown rice, quinoa)\n'
                                             '-> Vegetables (a colorful variety-not potatoes)\n'
                                             '-> Whole fruits (not fruit juices)\n'
                                             '-> Nuts, seeds, beans, and other healthful sources of protein (fish and poultry)\n'
                                             '-> Plant oils (olive and other vegetable oils)\n',style: TextStyle(
                                  fontSize: 20
                                ),),),
                              SizedBox(height: 5,),
                              Container(
                                height: 200,
                                child: Image(image: AssetImage('assets/images/Weight-Loss.jpg'),fit: BoxFit.cover,),),
                              Container(
                                height: 600,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(color: Colors.green),
                                child: Text('Calories\n'
                                    '\n -> For a weight loss of 1–1 ½ pounds per week, daily intake should be reduced by 500 to 750 calories. In general\n'
                                    '\n(1)Eating plans that contain 1,200–1,500 calories each day will help most women lose weight safely.\n'
                                    '\n(2)Eating plans that contain 1,500–1,800 calories each day are suitable for men and for women who weigh more or who exercise regularly.',style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22
                                ),),
                              ),
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
      ),
    );
  }
}
