import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.rad, required this.child});

  final double rad;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0x99666666),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(rad)),
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}
