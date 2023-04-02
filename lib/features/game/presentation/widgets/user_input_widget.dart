import 'package:flutter/material.dart';

class UserInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode _focusNode = FocusNode();

  UserInputWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade200,
      ),
      child: GestureDetector(
        onTap: () {
          _focusNode.unfocus();
        },
        child: TextField(
          enabled: false,
          focusNode: _focusNode,
          controller: controller,
          autocorrect: false,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Type your answer here',
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
