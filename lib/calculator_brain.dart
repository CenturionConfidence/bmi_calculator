import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  double bmi = 0.0;
  String calculateBMI() {
    bmi = weight / pow(height, 2);
    return bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (bmi >= 10) {
      return 'Overweight';
    } else if (bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (bmi >= 10) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (bmi >= 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. Try to eat more food';
    }
  }
}
