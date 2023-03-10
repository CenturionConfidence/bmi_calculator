import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/result_screen.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({
    required this.onTap,
    required this.title,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kBottomHeight,
        color: kColor,
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: kButtonStyle,
          ),
        ),
      ),
    );
  }
}
