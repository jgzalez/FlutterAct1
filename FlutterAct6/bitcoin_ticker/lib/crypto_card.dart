// File: lib/crypto_card.dart
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final String cryptoType;
  final double conversionRate;
  final String selectedCurrency; // Add this line

  CryptoCard(
      {required this.cryptoType,
      required this.conversionRate,
      required this.selectedCurrency});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          '1 $cryptoType = ${conversionRate.toStringAsFixed(2)} $selectedCurrency',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );
  }
}
