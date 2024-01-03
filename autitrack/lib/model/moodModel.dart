import 'package:cloud_firestore/cloud_firestore.dart';

class MoodModel {
  final String behaviorOccur;
  final String date;
  final String place;
  final String symptomBefore;
  final String symptomAfter;

  MoodModel({
    required this.behaviorOccur,
    required this.date,
    required this.place,
    required this.symptomBefore,
    required this.symptomAfter,
  });

  // Factory method to convert Firestore document to MoodModel
  factory MoodModel.fromDoc(DocumentSnapshot doc) {
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

    return MoodModel(
      behaviorOccur: data? ['behaviour occur'] ?? '',
      date: data? ['date'] ?? '',
      place: data? ['place'] ?? '',
      symptomBefore: data? ['Symptom before'] ?? '',
      symptomAfter: data? ['Symptom after'] ?? '',
    );
  }
}