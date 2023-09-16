# Weather App - Flutter

### Description:
------------
A simple Flutter-based weather application that provides real-time weather updates based on the user's current location or a city the user searches for. The app uses OpenWeatherMap API for weather data retrieval.

### Features:
---------
1. Fetches and displays weather data for the user's current location using IP.
2. Allows users to search for weather data by city.
3. Provides an option to refresh the weather data for the current location.
4. Displays the temperature in Celsius and a relevant emoji based on the weather condition.

### Usage:
------
1. Launch the application.
2. The app will load and fetch the weather data for your current location.
3. The main page displays the city's name, current temperature, and an emoji representing the weather.
4. Use the refresh button in the top-left corner to refresh the weather data for the current location.
5. Use the search button in the top-right corner to navigate to the search page. Enter a city's name and press the search button to fetch and view the weather data for the chosen city.

### Dependencies:
-------------
- Flutter SDK
- http package for API calls
- flutter_spinkit for the loading animation

### APIs Used:
----------
- OpenWeatherMap for weather data
- IPinfo.io for fetching the current city based on IP

### Setup:
------
1. Clone the repository.
2. Navigate to the project directory and run `flutter pub get`.
3. Ensure you have set up an emulator or have a physical device connected.
4. Run `flutter run` to launch the application.


