import 'package:flutter/material.dart';
import 'input_page.dart';

class Calculator {
  double calculateBMI(int weight, int height) {
    double bmi;
    bmi = ((weight / height / height) * 10000);

    return bmi.round().toDouble();
  }
}
