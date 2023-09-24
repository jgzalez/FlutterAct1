// File: lib/main_screen.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'crypto_card.dart';
import 'coin_data.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedCurrency = 'USD';
  double btcRate = 0.0;
  double ethRate = 0.0;
  double ltcRate = 0.0;

  void getConversionRates() async {
    final apiKey = '3B1741A1-360A-4CF2-B233-6229636B15DE';
    final url = Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          btcRate = data['rate'];
        });

        final ethUrl = Uri.parse(
            'https://rest.coinapi.io/v1/exchangerate/ETH/$selectedCurrency?apikey=$apiKey');
        final ethResponse = await http.get(ethUrl);
        final ethData = jsonDecode(ethResponse.body);
        setState(() {
          ethRate = ethData['rate'];
        });

        final ltcUrl = Uri.parse(
            'https://rest.coinapi.io/v1/exchangerate/LTC/$selectedCurrency?apikey=$apiKey');
        final ltcResponse = await http.get(ltcUrl);
        final ltcData = jsonDecode(ltcResponse.body);
        setState(() {
          ltcRate = ltcData['rate'];
        });
      } else {
        throw Exception('Failed to load conversion rates');
      }
    } catch (e) {
      print('Error: $e');
      // You may want to display an error message to the user
    }
  }

  @override
  void initState() {
    super.initState();
    getConversionRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crypto Converter')),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center widgets vertically
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Arrange cards vertically
          CryptoCard(
              cryptoType: 'BTC',
              conversionRate: btcRate,
              selectedCurrency: selectedCurrency),
          CryptoCard(
              cryptoType: 'ETH',
              conversionRate: ethRate,
              selectedCurrency: selectedCurrency),
          CryptoCard(
              cryptoType: 'LTC',
              conversionRate: ltcRate,
              selectedCurrency: selectedCurrency),
          // ... rest of your UI ...
          // Expanded widget to push the dropdown button to the bottom
          Expanded(
            child: Container(),
          ),
          // Dropdown button
          Container(
            width: double.infinity, // Stretch across the screen
            color: Colors.blue, // Blue background
            padding: EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 8.0), // Add some padding

            child: DropdownButton<String>(
              value: selectedCurrency,
              items:
                  currenciesList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCurrency = newValue!;
                  getConversionRates();
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
