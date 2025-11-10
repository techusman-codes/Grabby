// ============================================================================
// FILE: lib/widgets/section_title.dart
// PURPOSE: Reusable section title widget
// USED IN: Multiple screens for consistent headings
// ============================================================================

import 'package:flutter/widgets.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
