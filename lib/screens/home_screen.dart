import 'package:bmi_calculator/Widgets/rounded_icon.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/widgets/button_action.dart';

import '../widgets/card_content.dart';
import '../widgets/reuseable_card.dart';

import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender _gender = Gender.male;
  int height = 0;
  int weight = 0;
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                      color: _gender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const CardContent(
                        FontAwesomeIcons.mars,
                        'MALE',
                      ),
                      onPress: (() {
                        setState(() {
                          _gender = Gender.male;
                        });
                      })),
                ),
                Expanded(
                  child: ReuseableCard(
                      color: _gender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const CardContent(
                        FontAwesomeIcons.venus,
                        'FEMALE',
                      ),
                      onPress: (() {
                        setState(() {
                          _gender = Gender.female;
                        });
                      })),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
                onPress: () {},
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Height', style: kTextStyle1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kTextStyle2),
                        const Text('cm', style: kTextStyle1),
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        activeTrackColor: kWhite,
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30,
                        ),
                        thumbColor: kColor,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 0,
                        max: 200,
                        inactiveColor: kInactiveCardColor,
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Weight', style: kTextStyle1),
                        Text(weight.toString(), style: kTextStyle2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIcon(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                                print(weight);
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundedIcon(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Age', style: kTextStyle1),
                        Text(age.toString(), style: kTextStyle2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIcon(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                                print(weight);
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundedIcon(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: (() {}),
                  ),
                )
              ],
            ),
          ),
          ButtonAction(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
              );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ResultScreen(
                    resultText: calc.getResult(),
                    bmiResult: calc.calculateBMI(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            title: 'Calculate',
          )
        ],
      ),
    );
  }
}
