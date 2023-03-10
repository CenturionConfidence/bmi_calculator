import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  const RoundedIcon({required this.onTap, required this.icon, super.key});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onTap,
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      child: Icon(icon),
    );
  }
}
