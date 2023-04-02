import 'package:flutter/material.dart';

class CongratsMessage extends StatelessWidget {
  final VoidCallback onRestartPressed;

  const CongratsMessage({
    Key? key,
    required this.onRestartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Congratulations!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('You found all the possible words!'),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Restart'),
            onPressed: () {
              print("Pressed");
              onRestartPressed();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
