import 'dart:ui';

import 'package:flutter/material.dart';

class TombButtonModel {
  final String text;
  final Color backgroundColor;
  final double fontSize;
  final double width;
  final double height;
  final VoidCallback onPressed;

  TombButtonModel({
    required this.text,
    this.backgroundColor = Colors.blue,
    this.fontSize = 16.0,
    this.width = 150.0,
    this.height = 50.0,
    required this.onPressed,
  });
}
