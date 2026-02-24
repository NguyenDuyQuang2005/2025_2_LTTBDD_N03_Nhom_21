import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLocation extends StatelessWidget {
  const HomeLocation({super.key, required this.nameLocation});

  final String nameLocation;

  static const Map<String, String> cityVietnamese = {
    "Hanoi": "Hà Nội",
    "Ho Chi Minh City": "TP. Hồ Chí Minh",
    "Da Nang": "Đà Nẵng",
    "Can Tho": "Cần Thơ",
  };

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd-MM-yyyy');
    String displayName = cityVietnamese[nameLocation] ?? nameLocation;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/weather/vitri.png'),
            SizedBox(width: 10),
            Text(
              displayName,
              style: const TextStyle(fontSize: 28, color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: 17),
        Text(
          df.format(DateTime.now()),
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ],
    );
  }
}
