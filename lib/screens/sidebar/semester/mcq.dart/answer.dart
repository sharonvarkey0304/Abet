import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  });

  final String question;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWorngAnswer = !isCorrectAnswer && isSelected;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: selectedAnswerIndex != null
            ? Container(
                height: 70,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    width: 2,
                    color: isCorrectAnswer
                        ? Colors.green
                        : isWorngAnswer
                            ? Colors.red
                            : Colors.white,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        question,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )
            : Container(
                height: 70,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.black,
                    )),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        question,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ));
  }
}

Widget buildCorrectIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.black,
      ),
    );

Widget buildWorngtIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.close,
        color: Colors.black,
      ),
    );
