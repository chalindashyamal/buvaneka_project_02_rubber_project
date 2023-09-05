import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

void main() {
  runApp(const MaterialApp(
    home: WeatherDashboardScreen(),
  ));
}

class WeatherDashboardScreen extends StatefulWidget {
  const WeatherDashboardScreen({Key? key}) : super(key: key);

  @override
  _WeatherDashboardScreenState createState() => _WeatherDashboardScreenState();
}

class _WeatherDashboardScreenState extends State<WeatherDashboardScreen> {
  WeatherFactory wf = WeatherFactory(
      "6d6fde202290e617a90a412bc2287335"); // Replace with your API key
  Weather? w;

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  Future<void> getWeather() async {
    w = await wf.currentWeatherByCityName('Bandarawela');
    setState(() {}); // Update the state to trigger a rebuild
  }

  @override
  Widget build(BuildContext context) {
    return w != null // Check if w is initialized before building the UI
        ? Scaffold(
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
                  CurrentDayWeatherCard(
                    temperature:
                        w?.temperature?.celsius?.toStringAsFixed(0) ?? '',
                    condition: w?.weatherDescription ?? '',
                    icon: _getWeatherIcon(w?.weatherMain ?? ''),
                    icolor: _getWeatherColor(w?.weatherMain ?? ''),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtherDetailsCard(
                        title: 'Humidity',
                        value: '${w?.humidity?.toString()}%' ?? '',
                        icon: Icons.water_damage,
                        icolor: Colors.blueAccent,
                      ),
                      OtherDetailsCard(
                        title: 'Pressure',
                        value: '${w?.pressure?.toStringAsFixed(0)}hPa' ?? '',
                        icon: Icons.compress,
                        icolor: Colors.amber,
                      ),
                      OtherDetailsCard(
                        title: 'Wind',
                        value: '${w?.windSpeed?.toString()} km/h' ?? '',
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
          )
        : Scaffold(
            body: Center(
              child:
                  CircularProgressIndicator(), // Show loading indicator while fetching weather data
            ),
          );
  }
}

class CurrentLocationCard extends StatelessWidget {
  const CurrentLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    String currentLocation = 'Bandarawela';

    return _buildCard(
      content: Text(
        currentLocation,
        style: const TextStyle(fontSize: 18),
      ),
      icon: Icons.location_on,
      icolor: Colors.red,
    );
  }
}

class CurrentDayWeatherCard extends StatelessWidget {
  final String temperature;
  final String condition;
  final IconData icon;
  final Color icolor;

  const CurrentDayWeatherCard({
    required this.temperature,
    required this.condition,
    required this.icon,
    required this.icolor,
  });

  @override
  Widget build(BuildContext context) {
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
        icon: icon,
        icolor: icolor);
  }
}

IconData _getWeatherIcon(String condition) {
  switch (condition) {
    case 'Thunderstorm':
      return Icons.flash_on;
    case 'Drizzle':
      return Icons.grain;
    case 'Rain':
      return Icons.beach_access;
    case 'Snow':
      return Icons.ac_unit;
    case 'Mist':
      return Icons.cloud_circle;
    case 'Smoke':
      return Icons.smoke_free;
    case 'Haze':
      return Icons.cloud;
    case 'Dust':
      return Icons.cloud;
    case 'Fog':
      return Icons.cloud;
    case 'Sand':
      return Icons.cloud;
    case 'Ash':
      return Icons.cloud;
    case 'Squall':
      return Icons.flash_on;
    case 'Tornado':
      return Icons.tornado;
    case 'Clear':
      return Icons.wb_sunny;
    case 'Clouds':
      return Icons.cloud;
    default:
      return Icons.cloud;
  }
}

String _getDate(int Day) {
  if (Day == 1) {
    return 'Monday';
  } else if (Day == 2) {
    return 'Tuesday';
  } else if (Day == 3) {
    return 'Wednesday';
  } else if (Day == 4) {
    return 'Thursday';
  } else if (Day == 5) {
    return 'Friday';
  } else if (Day == 6) {
    return 'Saturday';
  } else {
    return 'Sunday';
  }
}

Color _getWeatherColor(String condition) {
  switch (condition) {
    case 'Thunderstorm':
      return Colors.amber;
    case 'Drizzle':
      return Colors.blue;
    case 'Rain':
      return Colors.blue;
    case 'Snow':
      return Colors.blue;
    case 'Mist':
      return const Color.fromARGB(96, 113, 113, 113);
    case 'Smoke':
      return const Color.fromARGB(96, 113, 113, 113);
    case 'Haze':
      return const Color.fromARGB(96, 81, 81, 81);
    case 'Dust':
      return const Color.fromARGB(96, 113, 113, 113);
    case 'Fog':
      return const Color.fromARGB(96, 113, 113, 113);
    case 'Sand':
      return const Color.fromARGB(96, 113, 113, 113);
    case 'Ash':
      return const Color.fromARGB(96, 113, 113, 113);
    case 'Squall':
      return Colors.amber;
    case 'Tornado':
      return Colors.black;
    case 'Clear':
      return Colors.orange;
    case 'Clouds':
      return const Color.fromARGB(96, 113, 113, 113);
    default:
      return const Color.fromARGB(96, 113, 113, 113);
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

class WeatherWeekDetails extends StatefulWidget {
  WeatherWeekDetails({super.key});

  @override
  _WeatherWeekDetailsState createState() => _WeatherWeekDetailsState();
}

class _WeatherWeekDetailsState extends State<WeatherWeekDetails> {
  WeatherFactory wf = WeatherFactory(
      "6d6fde202290e617a90a412bc2287335"); // Replace with your API key
  List<Weather> weeklyWeather = [];

  @override
  void initState() {
    super.initState();
    getWeeklyWeather();
  }

  Future<void> getWeeklyWeather() async {
    // Fetch weather data for the upcoming week using fiveDayForecastByCityName
    List<Weather> forecast = await wf.fiveDayForecastByCityName('Bandarawela');

    // Select one weather data per day
    List<Weather> filteredForecast = [];
    DateTime currentDate = DateTime.now();
    for (Weather weather in forecast) {
      if (weather.date!.day != currentDate.day) {
        filteredForecast.add(weather);
        currentDate = weather.date!;
      }
    }

    weeklyWeather = filteredForecast;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Weekly Weather Details',
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

  Widget _buildWeatherDetailCard(Weather dayWeather) {
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

  Widget dayWeatherCardContent(Weather dayWeather) {
    return Row(
      children: [
        Icon(
          _getWeatherIcon(dayWeather.weatherMain!),
          size: 36,
          color: _getWeatherColor(dayWeather.weatherMain!),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ListTile(
            title: Text(
              _getDate(dayWeather.date!.weekday),
              style: TextStyle(fontWeight: FontWeight.bold),
            ), // Display weekday
            subtitle: Text(
                '${dayWeather.temperature?.celsius?.toStringAsFixed(0) ?? ''}°C - ${dayWeather.weatherDescription}'),
          ),
        ),
      ],
    );
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
