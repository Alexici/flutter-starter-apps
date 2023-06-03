import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: kBackgroundColor,
      appBarTheme: const AppBarTheme(
        color: kBackgroundColor,
        titleTextStyle: kLabelTextStyle,
      ),
      colorScheme: const ColorScheme.dark(),
    ),
    home: const BMICalculator(),
    title: 'BMI Calculator',
  ));
}
