import 'package:btltodolist/app/utils/asset.dart';
import 'package:flutter/material.dart';

class HomeTemperature extends StatelessWidget {
  const HomeTemperature({
    super.key,
    required this.temp,
    required this.nameIcon,
    required this.tempMin,
    required this.tempMax,
    required this.feelsLike,
  });
  final double tempMin;
  final double tempMax;
  final double feelsLike;
  final num temp;
  final String nameIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  temp.toStringAsFixed(0),
                  style: const TextStyle(fontSize: 80, color: Colors.white),
                ),
                const Text(
                  "°",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ],
            ),
            Text(
              'Nhiều Mây',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "${tempMax.toStringAsFixed(0)}°",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                Text(' /', style: TextStyle(fontSize: 14, color: Colors.white)),
                Text(
                  " ${tempMin.toStringAsFixed(0)}°",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                Text(
                  " Cảm giác như ${feelsLike.toStringAsFixed(0)}°C",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ],
        ),
        Image.asset(
          AssetCustom.getLinkImg(nameIcon),
          fit: BoxFit.contain,
          height: 150,
        ),
      ],
    );
  }
}
