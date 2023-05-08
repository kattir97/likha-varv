// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LetterWidget extends StatelessWidget {
  final String letter;
  final Color bgColor;

  const LetterWidget({
    Key? key,
    required this.letter,
    this.bgColor = const Color.fromRGBO(166, 198, 233, 1.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          letter,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
