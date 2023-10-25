import 'package:flutter/material.dart';

class SideBarButtonData {
  final IconData icon;
  final String title;
  final Widget content;
  final int index;

  SideBarButtonData({
    required this.icon,
    required this.title,
    required this.content,
    required this.index,
  });
}