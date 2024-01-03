import 'package:flutter/material.dart';
import 'package:autitrack/util/my_tab.dart';
import '../Tab/Anger_Tab.dart';
import '../Tab/Anxiety_Tab.dart';
import '../Tab/Irritability_Tab.dart';
import '../Tab/Sad_Tab.dart';




class MoodPage extends StatefulWidget {
  final String currentUserId;


  const MoodPage({required this.currentUserId});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {

  //my tabs
  List<Widget> myTabs = [

    //angry tab
    MyTab(iconPath: 'lib/icons/anger.png'),
    //sad tab
    MyTab(iconPath: 'lib/icons/sad.png'),

    //anxiety tab
    MyTab(iconPath: 'lib/icons/anxiety.png'),

    //irritability tab
    MyTab(iconPath: 'lib/icons/aggressive.png')
  ];



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: myTabs.length,
      child: Scaffold(
          backgroundColor: Colors.lightGreen[100],
          appBar: AppBar(
            backgroundColor: Colors.lightGreen[100],
            title: Center(child: Text('Autism Triggers List', style: TextStyle(fontSize: 32, color: Colors.white))),
          ),
          body: Column(
            children: [
              Padding(padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18.0),
                child: Row(
                  children: const [
                    Center(
                      child:
                      Text("The Autism's Child Possible Mood", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),

                    ),],
                ),
              ),
              const SizedBox(height: 24),
              //tab bar
              TabBar(tabs: myTabs),

              Expanded(child
                  : TabBarView(
                    children: [
                     //anger page
                     AngerTab(),

                     //Sad Page
                     SadTab(),

                     //anxiety Page
                     AnxietyTab(),

                      //irritability Page
                     IrritabilityTab(),

                ],
              ),
              )




              //tab bar view




            ],
          )
      ),
    );
  }
}
