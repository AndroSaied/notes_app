import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: isActive ? Colors.white : color,
      child:  CircleAvatar(
        radius: 26,
        backgroundColor: color,
      ),
    );
  }
}