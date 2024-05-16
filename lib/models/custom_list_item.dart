import 'package:flutter/material.dart';

class CustomListItem {
  CustomListItem({
    required this.title,
    required this.icon,
    required this.screen,
  });

  final String title;
  IconData icon;
  Widget screen;
}
