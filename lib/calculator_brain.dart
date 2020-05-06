import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;
  String calculateBMI() {
    _bmi = (weight /  pow(height, 2)) * 703;
    return _bmi.toStringAsFixed(1);
  }

  String getResult() => _bmi >= 25 ? 'Overweight' : _bmi >= 18.5 ? "Normal" : 'Underweight';

  String getInterpretation() => _bmi >= 25 ? 'Work out and diet!' : _bmi >= 18.5 ? "Keep it up!" : 'Try a box of twinkies...';


}