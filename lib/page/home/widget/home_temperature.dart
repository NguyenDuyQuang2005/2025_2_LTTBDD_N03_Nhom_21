import 'package:flutter/material.dart';

class HomeTemperature extends StatelessWidget {
  const HomeTemperature({super.key, required this.temp});

  final num temp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temp.toStringAsFixed(0),
          style: const TextStyle(fontSize: 100, color: Colors.white),
        ),
        const Text("°C", style: TextStyle(fontSize: 36, color: Colors.white)),
      ],
    );
  }
}
