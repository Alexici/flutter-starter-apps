import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
          'There has been an error, please check if you have your GPS enabled and allowed, also check your internet connection.'),
    );
  }
}
