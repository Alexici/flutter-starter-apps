import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  const CoinCard(
      {super.key,
      required this.coinValue,
      required this.selectedCurrency,
      required this.coin});

  final double coinValue;
  final String? selectedCurrency;
  final String? coin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Card(
        color: Colors.teal.shade800,
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 28),
          child: Text(
            '1 $coin = ${coinValue.toStringAsFixed(2)} $selectedCurrency',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
