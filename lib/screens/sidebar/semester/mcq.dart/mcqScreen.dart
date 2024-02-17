import 'package:flutter/material.dart';
import 'package:loginpage/screens/sidebar/semester/mcq.dart/answer.dart';
import 'package:loginpage/screens/sidebar/semester/mcq.dart/nextButton.dart';
import 'package:loginpage/screens/sidebar/semester/mcq.dart/question.dart';
import 'package:loginpage/screens/sidebar/semester/mcq.dart/result.dart';

class McqScreen extends StatefulWidget {
  const McqScreen({super.key});

  @override
  State<McqScreen> createState() => _McqScreenState();
}

class _McqScreenState extends State<McqScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    setState(() {
      selectedAnswerIndex = value;
      final question = questions[questionIndex];

      if (selectedAnswerIndex == question.correctAnswerIndex) {
        score++;
      }
    });
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
        print(questionIndex);

        selectedAnswerIndex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];

    bool isLastQuestion = questionIndex == questions.length - 1;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 238, 4),
        title: const Text(
          'Brainiac Battle',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              question.question,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.option.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: selectedAnswerIndex == null
                      ? () {
                          pickAnswer(index);
                        }
                      : null,
                  child: AnswerCard(
                    currentIndex: index,
                    question: question.option[index],
                    isSelected: selectedAnswerIndex == index,
                    selectedAnswerIndex: selectedAnswerIndex,
                    correctAnswerIndex: question.correctAnswerIndex,
                  ),
                );
              },
            ),
            isLastQuestion
                ? RectangularButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => ResultScreen(
                            score: score,
                          ),
                        ),
                      );
                    },
                    label: 'Finish',
                  )
                : RectangularButton(
                    onPressed:
                        selectedAnswerIndex != null ? goToNextQuestion : null,
                    label: 'Next',
                  ),
          ],
        ),
      ),
    );
  }
}
