import 'package:http/http.dart' as http;
import 'dart:convert';

final String apiKey =
    '68fe024c340a3328b76f2d9e7f94a29d'; // Replace with your OpenWeatherMap API key
final String openWeatherMapURL =
    'https://api.openweathermap.org/data/2.5/weather';

Future<String> getCurrentCity() async {
  final response =
      await http.get(Uri.parse('https://ipinfo.io/json?token=3649187c000822'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['city'];
  } else {
    throw Exception('Failed to fetch location data');
  }
}

Future<Map<String, dynamic>> getCityWeather(String cityName) async {
  var response =
      await http.get(Uri.parse('$openWeatherMapURL?q=$cityName&appid=$apiKey'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    throw Exception('Failed to load weather data');
  }
}
