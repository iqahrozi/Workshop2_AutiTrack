import 'package:autitrack/util/MoodTile.dart';
import 'package:flutter/material.dart';

import '../screen/moodCategory.dart';


class AnxietyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[100], // Set the desired color

        title: Center(

          child: Text('Mood of autism : Anxiety',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

      ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
            child: Card(
            elevation: 4,
            margin: EdgeInsets.all(16),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       'Symptoms of Anxiety:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                           ),
                    SizedBox(height: 10),
                     Text('- Anxiety can be expressed through :',
                       style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                     ),
                      _buildSymptom('- 1. Avoidance behaviours'),
                      _buildSymptom('- 2. Increased anxiety'),
                      _buildSymptom('- 3. Heightened arousal'),
                     Text('- What can trigger anxiety?',
                       style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                     ),
                      _buildTrigger('- 1. Unfamiliar environment'),
                      _buildTrigger('- 2. Loud noises'),
                      _buildTrigger('- 3. Social situatuions'),
                   // Add more symptoms and triggers as needed
                    SizedBox(height: 40),
                    Center(
                        child: ElevatedButton(
                          onPressed: () {
                          _handleAddSadness(context);
                          },
                          child: Text("Add Mood"),
                          ),
                        ),

                        ],),
              ),
            ),
        ),
    ),
    );
  }

  Widget _buildSymptom(String symptom) {
    return Container(
      color: Colors.pinkAccent[100], // Customize the color as needed
      padding: EdgeInsets.all(8),
      child: Text(symptom),
    );
  }

  Widget _buildTrigger(String trigger) {
    return Container(
      color: Colors.purple[100], // Customize the color as needed
      padding: EdgeInsets.all(8),
      child: Text(trigger),
    );
  }

  void _handleAddSadness(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(),
      ));
  }
}
