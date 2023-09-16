import 'package:flutter/material.dart';
import 'weather_helper.dart';
import 'search_page.dart';

class MainPage extends StatefulWidget {
  final Map<String, dynamic> weatherData;

  MainPage({required this.weatherData});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Map<String, dynamic>? currentWeatherData;
  late String cityName;
  late double temperature;
  late String weatherDescription;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
    currentWeatherData = widget.weatherData;
  }

  void refreshWeatherData() async {
    try {
      print("Refreshing weather data...");
      String currentCity = await getCurrentCity();
      var newWeatherData = await getCityWeather(currentCity);
      setState(() {
        currentWeatherData = newWeatherData;
        updateUI(newWeatherData); // <-- Add this line
      });
      print("Weather data refreshed!"); // <-- Add this
    } catch (error) {
      print(error);
      // Handle error: maybe show a snackbar or dialog to the user
    }
  }

  void updateUI(Map<String, dynamic> weatherData) {
    setState(() {
      cityName = weatherData['name'];
      temperature = weatherData['main']['temp'] -
          273.15; // Convert from Kelvin to Celsius
      weatherDescription = weatherData['weather'][0][
          'main']; // This will give us the main weather condition e.g. "Rain", "Sunny", etc.
    });
  }

  Widget weatherEmoji() {
    switch (weatherDescription.toLowerCase()) {
      case 'rain':
        return Text('🌧️');
      case 'clear':
        return Text('☀️');
      case 'clouds':
        return Text('☁️');
      // Add other cases as needed
      default:
        return Text('🌦️');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                cityName,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${temperature.toStringAsFixed(1)}',
                    style: TextStyle(fontSize: 80.0),
                  ),
                  Text(
                    '°C',
                    style: TextStyle(fontSize: 40.0),
                  ),
                  SizedBox(width: 10.0),
                  weatherEmoji(),
                ],
              ),
            ],
          ),
          Positioned(
            top: 30.0,
            left: 30.0,
            child: IconButton(
                icon: Icon(Icons.refresh), onPressed: refreshWeatherData),
          ),
          Positioned(
            top: 30.0,
            right: 30.0,
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                var returnedWeatherData = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );

                if (returnedWeatherData != null) {
                  updateUI(returnedWeatherData);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
