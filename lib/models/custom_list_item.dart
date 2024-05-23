import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomListItem {
  CustomListItem({
    required this.title,
    required this.icon,
    required this.screen,
  });

  String title;
  IconData icon;
  Widget screen;
}
