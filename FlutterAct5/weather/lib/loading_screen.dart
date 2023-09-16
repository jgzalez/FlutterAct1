import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'main_page.dart';
import 'weather_helper.dart'; // <-- Import the weather_helper here

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var weatherData;
    try {
      String currentCity =
          await getCurrentCity(); // <-- Use the method from weather_helper
      weatherData = await getCityWeather(
          currentCity); // <-- Use the method from weather_helper
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(weatherData: weatherData),
        ),
      );
    } catch (error) {
      print(error);
      // Handle the error appropriately
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
