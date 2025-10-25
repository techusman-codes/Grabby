import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const LinkButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Text(
        text,
        style: TextStyle(color: AppColors.primary, fontSize: 14),
      ),
    );
  }
}
