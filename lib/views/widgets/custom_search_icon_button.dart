import 'package:flutter/material.dart';

class CustomSearchIconButton extends StatelessWidget {
  const CustomSearchIconButton({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, size: 30,),
    );
  }
}