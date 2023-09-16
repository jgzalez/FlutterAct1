import 'package:flutter/material.dart';
import 'loading_screen.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(), // Starts with the loading screen.
      debugShowCheckedModeBanner: false, // Optional: Removes the debug banner.
    );
  }
}
