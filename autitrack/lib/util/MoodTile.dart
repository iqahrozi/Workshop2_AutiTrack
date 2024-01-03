import 'package:autitrack/screen/addMood.dart';
import 'package:flutter/material.dart';

import '../screen/moodDetail.dart';

class MoodTile extends StatelessWidget {
  final String mood;
  final String description;
  final moodColor;
  final String imageName;
  final double borderRadius = 12;

  const MoodTile({
    Key? key,
    required this.mood,
    required this.description,
    required this.moodColor,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: moodColor[100],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
        ),
        child: Column(
          children: [
            //description
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(color: moodColor),
                  padding: EdgeInsets.all(12),
                  child: Text(
                    mood,
                    style: TextStyle(
                        color: moodColor[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )
              ],
            ),

            //picture
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 12),
              child: Image.asset(imageName),
            ),

            //description
            Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Mood",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),

            //love icon/ add icon
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.pink[400],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the details screen here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detail(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.pink[400],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}