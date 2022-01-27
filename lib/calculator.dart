import 'package:flutter/material.dart';
import 'input_page.dart';

class Calculator {
  double calculateBMI(int weight, int height) {
    double bmi;
    bmi = ((weight / height / height) * 10000);

    return bmi.round().toDouble();
  }

  String bmiRange() {
    if (calculateBMI(userWeight, userHeight) >= 30.0) {
      return "Obese";
    } else if (calculateBMI(userWeight, userHeight) >= 25 &&
        calculateBMI(userWeight, userHeight) <= 29.9) {
      return "Overweight";
    } else if (calculateBMI(userWeight, userHeight) >= 18.5 &&
        calculateBMI(userWeight, userHeight) <= 24.9) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String bmiMessage() {
    if (bmiRange() == "Obese") {
      return "It's time to diet and exercise";
    } else if (bmiRange() == "Normal") {
      return "You are doing just fine. Keep it up!";
    } else {
      return "Might need to eat some more";
    }
  }
}
