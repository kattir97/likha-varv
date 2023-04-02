import 'package:flutter/material.dart';

void showErrorSnackbar(String text, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 1),
    ),
  );
}
