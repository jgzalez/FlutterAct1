import 'package:flutter/material.dart';
import 'weather_helper.dart'; // Import the helper file to access getCityWeather

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200], // <-- Set background color to teal
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Search Weather',
          style: TextStyle(color: Colors.teal[200]),
        ),
      ),
      body: Center(
        // <-- Wrap with Center widget
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300, // <-- Set width for TextField
                child: TextField(
                  style: TextStyle(
                      color: Colors.black87), // <-- Set text color to white
                  decoration: InputDecoration(
                    labelText: 'Enter City Name',
                    labelStyle: TextStyle(
                        color: Colors
                            .black87), // <-- Set label text color to white
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      // <-- Set focused border color to white
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 200, // <-- Set width for ElevatedButton
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.black54, // <-- Set button text color to teal
                  ),
                  onPressed: () async {
                    try {
                      var weatherData = await getCityWeather(cityName);
                      if (weatherData != null) {
                        Navigator.pop(context,
                            weatherData); // This sends the data back to MainPage
                      } else {
                        print("No weather data returned for $cityName");
                      }
                    } catch (error) {
                      print(
                          "Error fetching weather data for $cityName: $error");
                      // Handle error: maybe show a snackbar or dialog to the user
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Search'),
                      SizedBox(width: 10.0),
                      Icon(Icons.search),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
