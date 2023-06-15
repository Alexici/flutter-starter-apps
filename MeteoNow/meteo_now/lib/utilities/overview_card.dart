import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blueAccent,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              Text(data),
            ],
          )
        ],
      ),
    );
  }
}
