import 'package:flutter/material.dart';

class WeatherDashboardScreen extends StatelessWidget {
  const WeatherDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CurrentLocationCard(),
            const SizedBox(height: 20),
            const CurrentDayWeatherCard(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtherDetailsCard(
                  title: 'Humidity',
                  value: '65%',
                  icon: Icons.water_damage,
                  icolor: Colors.blueAccent,
                ),
                OtherDetailsCard(
                  title: 'Pressure',
                  value: '1012 hPa',
                  icon: Icons.compress,
                  icolor: Colors.amber,
                ),
                OtherDetailsCard(
                  title: 'Wind',
                  value: '8 km/h',
                  icon: Icons.wind_power,
                  icolor: Colors.black38,
                ),
              ],
            ),
            const SizedBox(height: 20),
            WeatherWeekDetails(),
          ],
        ),
      ),
    );
  }
}

class CurrentLocationCard extends StatelessWidget {
  const CurrentLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    String currentLocation = "Your Current Location";

    return _buildCard(
        content: Text(
          '$currentLocation',
          style: const TextStyle(fontSize: 18),
        ),
        icon: Icons.location_on,
        icolor: Colors.red);
  }
}

class CurrentDayWeatherCard extends StatelessWidget {
  const CurrentDayWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    String temperature = '25°C';
    String condition = 'Sunny';

    return _buildCard(
        backgroundColor: Colors.blue,
        content: Column(
          children: [
            const Text(
              'Today\'s Weather',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              'Temperature: $temperature',
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
            Text(
              'Condition: $condition',
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
        icon: Icons.wb_sunny,
        icolor: Colors.white);
  }
}

class OtherDetailsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color icolor;

  OtherDetailsCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.icolor,
  });

  @override
  Widget build(BuildContext context) {
    return _buildCard(
        content: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        icon: icon,
        icolor: icolor);
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

  WeatherWeekDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Weather Week Details',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: weeklyWeather.map(_buildWeatherDetailCard).toList(),
        ),
      ],
    );
  }

  Widget _buildWeatherDetailCard(Map<String, dynamic> dayWeather) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: dayWeatherCardContent(dayWeather),
      ),
    );
  }

  Widget dayWeatherCardContent(Map<String, dynamic> dayWeather) {
    return Row(
      children: [
        Icon(
          _getWeatherIcon(dayWeather['condition']),
          size: 36,
          color: _getWeatherColor(dayWeather['condition']),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ListTile(
            title: Text(dayWeather['day']),
            subtitle: Text(
                '${dayWeather['temperature']} - ${dayWeather['condition']}'),
          ),
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

  Color _getWeatherColor(String condition) {
    // Replace this with logic to determine the appropriate weather icon
    if (condition == 'Sunny') {
      return Colors.orange;
    } else if (condition == 'Cloudy') {
      return const Color.fromARGB(96, 113, 113, 113);
    } else if (condition == 'Partly Cloudy') {
      return const Color.fromARGB(96, 81, 81, 81);
    } else if (condition == 'Rainy') {
      return Colors.blue;
    } else if (condition == 'Thunderstorm') {
      return Colors.amber;
    } else {
      return const Color.fromARGB(96, 113, 113, 113);
    }
  }
}

Widget _buildCard({
  Color? backgroundColor,
  required Widget content,
  required IconData icon,
  required Color icolor,
}) {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    color: backgroundColor,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Icon(
            icon,
            size: 36,
            color: icolor,
          ),
          const SizedBox(height: 10),
          content,
        ],
      ),
    ),
  );
}

void main() {
  runApp(const MaterialApp(
    home: WeatherDashboardScreen(),
  ));
}
