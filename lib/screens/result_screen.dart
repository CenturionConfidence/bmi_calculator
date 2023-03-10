import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/button_action.dart';
import 'package:bmi_calculator/widgets/reuseable_card.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.resultText,
      required this.bmiResult,
      required this.interpretation,
      super.key});

  final String resultText;
  final String bmiResult;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Your Result',
                style: kTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              onPress: () {},
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText, style: kResultTitle),
                  Text(bmiResult, style: kResultValueStyle),
                  Text(
                    bmiResult,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          ButtonAction(
            onTap: () => Navigator.pop(context),
            title: 'Re-Calculate',
          )
        ],
      ),
    );
  }
}
