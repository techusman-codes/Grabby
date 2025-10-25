import 'package:flutter/material.dart';


class BottomCard extends StatelessWidget {
  final Widget child;
  final double radius;
  final EdgeInsets padding;

  const BottomCard({
    super.key,
    required this.child,
    this.radius = 20,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  });

  @override
  Widget build(BuildContext context) {
    // Use SafeArea bottom inset for spacing on iPhones with notch
    final bottom =
        MediaQuery.of(context).viewInsets.bottom +
        MediaQuery.of(context).padding.bottom;
    return Container(
      padding: padding.copyWith(bottom: padding.bottom + bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: child,
    );
  }
}
