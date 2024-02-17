import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final Color? bgcolor;
  final double? ContainerWidth;
  final String itext;

  const ContainerButton(
      {super.key,
      this.bgcolor,
      this.ContainerWidth,
      required this.itext,
      required double containerWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: ContainerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgcolor,
      ),
      child: Center(
        child: Text(
          itext,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
