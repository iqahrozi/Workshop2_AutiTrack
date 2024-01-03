import 'package:autitrack/screen/moodDetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:autitrack/controller/moodActivityController.dart';
import 'package:autitrack/screen/moodDetail.dart';
//import 'package:autitrack/repository/moodRepository.dart';


import '../model/moodModel.dart';

class Detail extends StatefulWidget {

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final behaviourEditingController = TextEditingController();
  final dateEditingController = TextEditingController();
  final placeEditingController = TextEditingController();
  final beforeEditingController = TextEditingController();
  final afterEditingController = TextEditingController();

  final _controller = MoodActivityController();

  void addMood({
    required String behaviourOccur,
    required String date,
    required String place,
    required String symptomBefore,
    required String symptomAfter,
  }) async {
    MoodModel mood = MoodModel(
      behaviorOccur: behaviourOccur,
      date: date,
      place: place,
      symptomBefore: symptomBefore,
      symptomAfter: symptomAfter,
    );

    await _controller.addMood(context, mood);

    try {
      String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
      // Access Firestore collection reference for parents or users
      CollectionReference moodCollection =
      FirebaseFirestore.instance.collection('mood');

      // Add the parent data to Firestore with the UID as the document ID
      await moodCollection.doc(uid).set({
        'behaviourOccur': behaviourOccur,
        'date': date,
        'place': place,
        'symptomBefore': symptomBefore,
        'symptomAfter': symptomAfter,
      });

      // Proceed with navigation or any other operations after successful document creation
    } catch (error) {
      // Handle any potential errors
      print('Error creating mood document: $error');
    }
  }


String selectedBehavior = 'Sad';
  List<String> behaviorOptions = ['Anger', 'Sad', 'Anxiety', 'Irritability'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[100],

        title: Center(
          child: Text(
            'Mood Record',
            style: TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: _buildTabContent(),
    );
  }

  Widget _buildTabContent() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Text(
                    'Please fill the details below for',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  DropdownButton<String>(
                    value: selectedBehavior,
                    onChanged: (newValue) {
                      setState(() {
                        selectedBehavior = newValue!;
                      });
                    },
                    items: behaviorOptions.map((behavior) {
                      return DropdownMenuItem<String>(
                        value: behavior,
                        child: Text(behavior),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            buildTextField('Insert Place', placeEditingController),
            buildDateTextField('Insert Date', dateEditingController),
            buildTextField('Insert Symptom Before', beforeEditingController),
            buildTextField('Insert Symptom After', afterEditingController),
            ElevatedButton(
              onPressed: () async {
                addMood(
                  behaviourOccur: selectedBehavior,
                  date: dateEditingController.text,
                  place: placeEditingController.text,
                  symptomBefore: beforeEditingController.text,
                  symptomAfter: afterEditingController.text,
                );

                // Navigate to MoodDetailsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoodDetailsPage(
                      moodData: {
                        'behaviour occur':  selectedBehavior,
                        'date': dateEditingController.text,
                        'place': placeEditingController.text,
                        'Symptom before': beforeEditingController.text,
                        'Symptom after': afterEditingController.text,
                      },
                      selectedBehavior: selectedBehavior,
                    ),
                  ),
                );
              },
              child: Text('Save'),
            ),

          ],
        ),
      ),
    );
  }
  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }

  Widget buildDateTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: _selectDate,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }

  _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedDate != null && pickedTime != null) {
      setState(() {
        dateEditingController.text =
        "${pickedDate.year}-${pickedDate.month}-${pickedDate.day} "
            "${pickedTime.hour}:${pickedTime.minute}:00";
      });
    }
  }
}
