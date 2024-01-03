import 'package:flutter/material.dart';

import '../screen/moodCategory.dart';

class SadTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.lightGreen[100],
    appBar: AppBar(
      backgroundColor: Colors.yellow[100], // Set the desired color

      title: Center(

      child: Text(
            'Mood of Autism: Sadness',
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
                    'Symptoms of Sadness:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('- Sadness can be expressed through:',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  _buildSymptom('- 1. Facial expression'),
                  _buildSymptom('- 2. Body language'),
                  _buildSymptom('- 3. Vocalizations'),
                  SizedBox(height: 10),
                  Text('What can trigger sadness?',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  _buildTrigger('- 1. Change in routine'),
                  _buildTrigger('- 2. Social challenges'),
                  _buildTrigger('- 3. Difficulties in communication'),
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

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSymptom(String symptom) {
    return Container(
      color: Colors.blue[100], // Customize the color as needed
      padding: EdgeInsets.all(8),
      child: Text(symptom),
    );
  }

  Widget _buildTrigger(String trigger) {
    return Container(
      color: Colors.orange[100], // Customize the color as needed
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
