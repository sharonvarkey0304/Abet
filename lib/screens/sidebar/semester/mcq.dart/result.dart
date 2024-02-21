import 'package:flutter/material.dart';
import 'package:loginpage/screens/sidebar/semester/content.dart';

import 'package:loginpage/screens/sidebar/semester/mcq.dart/nextButton.dart';
import 'package:loginpage/screens/sidebar/semester/mcq.dart/question.dart';
import 'package:loginpage/screens/sidebar/semester/sem.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 238, 4),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            const Text(
              'Your Score',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 12,
                    value: score / 9,
                    color: Colors.lightGreen,
                    backgroundColor: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      score.toString() + "/10",
                      style: const TextStyle(
                        fontSize: 80,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(score / questions.length * 100).round()}%',
                      style: const TextStyle(fontSize: 30, color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 150,
            ),
            RectangularButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => SemesterPage(),
                  ),
                );
              },
              label: 'Restart',
            )
          ],
        ),
      ),
    );
  }
}
