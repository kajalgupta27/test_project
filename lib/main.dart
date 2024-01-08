


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var myindex=0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Test Project')),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab1',),
              Tab(text: 'Tab2',),
              Tab(text: 'Tab3',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Tab1(),
            Tab2(),
            Tab3(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
                   onTap: (index){
          setState(() {
            myindex=index;
          });
        },
       currentIndex:myindex ,

           // Set the initial index
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class Tab1 extends StatefulWidget {
  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return
Container();
  }
}

class Tab2 extends StatefulWidget {
  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  var currentStep=0;
  String selectedValue = 'value'; // Default selected value

  List<String> dropdownItems = ['value', 'male','female'];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stepper(
        steps: [
          Step
            (title: Text('step1'),
              content:Container(
                height: 200,
                width: 300,
                child:
             Column(
               children: [
                 TextField(decoration: InputDecoration(hintText: 'Name',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                 SizedBox(
                  height: 10,
                 ),
                 TextField(decoration: InputDecoration(hintText: 'Phone',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),

               ],

             ),),

          ),
          Step
            (title: Text('step2'),
              content: Container(
                height: 200,
                width: 300,
                child:
                Column(
                  children: [
                    TextField(decoration: InputDecoration(hintText: 'Pincode',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(decoration: InputDecoration(hintText: 'Locality',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),)
                  ],
                ),),
          ),
          Step
            (title: Text('step3'),
              content: Container(
                height: 200,
                width: 300,
                child:
                Column(
                  children: [
                    Text(
                      'Selected Value: $selectedValue',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    DropdownButton(
                      value: selectedValue,
                      items: dropdownItems.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                    ),
                  ],

                ),),
          ),
        ],
        onStepTapped: (int newIndex){
          setState(() {
            currentStep = newIndex;
          });
        },
        currentStep: currentStep,
        onStepContinue: (){
          if(currentStep != 2){
            setState(() {
              currentStep += 1;
            });
          }
        },
        onStepCancel: (){
          if(currentStep != 0){
            setState(() {
              currentStep -= 1;
            });
          }
        },
      ),
    );
  }
}

class Tab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
        // color: Colors.black,
        child: Column(
          children: [
            Container(
              height: 200,
              width: 700,
              color: Colors.red,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: 160,
                    color: Colors.greenAccent,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 200,
                    width: 160,
                    color: Colors.greenAccent,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
           Center(
             child: Stack(
               children: [
                 Container(
                   height: 450,
                   width: 700,
            color: Colors.yellow,

                 ),
                 Container(
                   margin: EdgeInsetsDirectional.all(70),
                   height: 300,
                   width: 550,
                   color: Colors.deepPurple,
                 )
               ],
             ),
           )
          ],
        ),
      ),
    ],
    );

  }
}
