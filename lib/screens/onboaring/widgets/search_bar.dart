import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final String hintText;
  final String icon;
  final String controller;

  const SearchBar({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: TextField());
  }
}
