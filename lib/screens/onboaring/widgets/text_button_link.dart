import 'package:flutter/material.dart';

class TextButtonLink extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const TextButtonLink({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.deepPurple,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
