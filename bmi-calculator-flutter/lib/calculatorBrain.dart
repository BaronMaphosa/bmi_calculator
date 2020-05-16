import  'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.height, this.weight});
  int height;
  int weight;

  double _bmi;
  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    }else if(_bmi >18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }
  String getInterpretation(){
    if(_bmi >= 25){
      return 'You need to start putting time in the gym, you have a higher than normal body weight';
    }else if(_bmi >18.5){
      return 'You are healthy as a horse mate, Good Job!';
    }else{
      return 'Make sure you get some food in there, you have a lower than normal body weight';
    }
  }
}