import 'package:flutter/material.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key, required this.wind, required this.humidity});

  final num wind;
  final num humidity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset('assets/images/weather/ph_wind.png'),
            Text('Gió', style: TextStyle(fontSize: 18, color: Colors.white)),
            Text(
              '${wind} km/h',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/weather/humidity.png'),
            SizedBox(height: 4),
            Text('Độ ẩm', style: TextStyle(fontSize: 18, color: Colors.white)),
            Text(
              '${humidity}%',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
