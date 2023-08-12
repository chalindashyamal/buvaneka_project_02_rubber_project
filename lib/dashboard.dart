import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CurrentLocationCard(),
            SizedBox(height: 20),
            CurrentDayWeatherCard(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OtherDetailsCard(
                  title: 'Humidity',
                  value: '65%',
                ),
                OtherDetailsCard(
                  title: 'Pressure',
                  value: '1012 hPa',
                ),
                OtherDetailsCard(
                  title: 'Wind',
                  value: '8 km/h',
                ),
              ],
            ),
            SizedBox(height: 20),
            WeatherWeekDetails(),
          ],
        ),
      ),
    );
  }
}

class CurrentLocationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your logic to get the current location
    String currentLocation = "Your Current Location";

    return _buildCard(
      content: Text(
        'Current Location: $currentLocation',
        style: TextStyle(fontSize: 18),
      ),
      icon: Icons.location_on,
    );
  }
}

class CurrentDayWeatherCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your logic to fetch current day weather data
    String temperature = '25°C';
    String condition = 'Sunny';

    return _buildCard(
      backgroundColor: Colors.blue,
      content: Column(
        children: [
          Text(
            'Today\'s Weather',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'Temperature: $temperature',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            'Condition: $condition',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
      icon: Icons.wb_sunny,
    );
  }
}

class OtherDetailsCard extends StatelessWidget {
  final String title;
  final String value;

  const OtherDetailsCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return _buildCard(
      content: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      icon: Icons.details,
    );
  }
}

class WeatherWeekDetails extends StatelessWidget {
  final List<Map<String, dynamic>> weeklyWeather = [
    {'day': 'Monday', 'temperature': '25°C', 'condition': 'Sunny'},
    {'day': 'Tuesday', 'temperature': '23°C', 'condition': 'Cloudy'},
    {'day': 'Wednesday', 'temperature': '28°C', 'condition': 'Partly Cloudy'},
    {'day': 'Thursday', 'temperature': '26°C', 'condition': 'Rainy'},
    {'day': 'Friday', 'temperature': '24°C', 'condition': 'Thunderstorm'},
    {'day': 'Saturday', 'temperature': '27°C', 'condition': 'Sunny'},
    {'day': 'Sunday', 'temperature': '29°C', 'condition': 'Sunny'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Weather Week Details',
          style: TextStyle(
              fontSize: 18, color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: weeklyWeather.map((dayWeather) {
            return _buildCard(
              content: ListTile(
                title: Text(dayWeather['day']),
                subtitle: Text(
                    '${dayWeather['temperature']} - ${dayWeather['condition']}'),
              ),
              icon: _getWeatherIcon(dayWeather['condition']),
            );
          }).toList(),
        ),
      ],
    );
  }

  IconData _getWeatherIcon(String condition) {
    // Replace this with logic to determine the appropriate weather icon
    if (condition == 'Sunny') {
      return Icons.wb_sunny;
    } else if (condition == 'Cloudy') {
      return Icons.cloud;
    } else if (condition == 'Partly Cloudy') {
      return Icons.wb_cloudy;
    } else if (condition == 'Rainy') {
      return Icons.beach_access;
    } else if (condition == 'Thunderstorm') {
      return Icons.flash_on;
    } else {
      return Icons.cloud;
    }
  }
}

Widget _buildCard(
    {Color? backgroundColor, required Widget content, required IconData icon}) {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    color: backgroundColor,
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Icon(
            icon,
            size: 36,
            color: backgroundColor == Colors.blue
                ? Color.fromARGB(255, 0, 0, 0)
                : Colors.black,
          ),
          SizedBox(height: 10),
          content,
        ],
      ),
    ),
  );
}
