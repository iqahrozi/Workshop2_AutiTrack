import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:autitrack/model/educatorModel.dart';
import 'package:autitrack/model/parentModel.dart';
import 'package:autitrack/screen/mainFeedPageParent.dart';

import '../screen/mainFeedPageEdu.dart';

class EducatorLoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? uid = FirebaseAuth.instance.currentUser?.uid;


  Future<UserCredential?> login(
      BuildContext context, EducatorModel educator) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: educator.educatorEmail,
        password: educator.educatorPassword,
      );
      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainFeedPageEdu(currentUserId: uid),
          ),
        );

      }
      return userCredential;
    } on FirebaseAuthException catch (ex) {
      _showLoginFailedDialog(context);
      print('FirebaseAuthException: ${ex.message}');
      return null;
    }
  }

  void _showLoginFailedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Invalid username or password.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}