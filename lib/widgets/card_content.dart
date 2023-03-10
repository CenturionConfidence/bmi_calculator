import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardContent extends StatelessWidget {
  const CardContent(
    this.icon,
    this.name, {
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: kTextStyle1,
        )
      ],
    );
  }
}
