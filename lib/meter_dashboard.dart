import 'package:flutter/material.dart';

class MeterDashboardScreen extends StatelessWidget {
  const MeterDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: const Text(
          'Meter Dashboard',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MeterCard(
                title: 'Temperature',
                value: '25°C',
                icon: Icons.thermostat_outlined,
                icolor: Colors.redAccent,
              ),
              MeterCard(
                title: 'Humidity',
                value: '65%',
                icon: Icons.water_damage,
                icolor: Colors.blueAccent,
              ),
              MeterCard(
                title: 'Soil Moisture',
                value: '45%',
                icon: Icons.waves,
                icolor: Colors.brown,
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            'Time to fertilize!',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/logo.png', // Replace with your image asset path
            width: 200,
            height: 200,
          ),
        ],
      ),
    );
  }
}

class MeterCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color icolor;

  const MeterCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.icolor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: icolor),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MeterDashboardScreen(),
  ));
}
