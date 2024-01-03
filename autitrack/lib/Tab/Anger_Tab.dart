import 'package:autitrack/screen/moodCategory.dart';
import 'package:autitrack/screen/moodPage.dart';
import 'package:flutter/material.dart';
import 'package:autitrack/screen/addMood.dart';


class AngerTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[100], // Set the desired color

        title: Center(

        child: Text('Mood of autism : Anger',
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
                'Symptoms of Anger:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
                     SizedBox(height: 10),
                      Text('- Anger can be expressed through :',
                     style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                    _buildSymptom('- 1. Verbal outburst'),
                    _buildSymptom('- 2. Physical agitation'),
                    _buildSymptom('- 3. Aggression'),
                   Text('- What can trigger anger?',
                     style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                   ),
                    _buildTrigger('- 1. Communication challenges'),
                    _buildTrigger('- 2. Sensory overload'),
                    _buildTrigger('- 3. Disruptions to routine'),
                    // Add more symptoms and triggers as needed
                    SizedBox(height: 40),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _handleAddAnger(context);
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
      color: Colors.orangeAccent[100], // Customize the color as needed
      padding: EdgeInsets.all(8),
      child: Text(symptom),
    );
  }

  Widget _buildTrigger(String trigger) {
    return Container(
      color: Colors.redAccent[100], // Customize the color as needed
      padding: EdgeInsets.all(8),
      child: Text(trigger),
    );
  }

  void _handleAddAnger(BuildContext context) {
    // Navigate to the activity details page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(),
      ),
    );
  }
}