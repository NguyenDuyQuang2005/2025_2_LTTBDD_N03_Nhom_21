import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeDate extends StatelessWidget {
  const HomeDate({super.key, required this.nameLocation});
  final String nameLocation;

  static const Map<String, String> cityVietnamese = {
    "Hanoi": "Hà Nội",
    "Ho Chi Minh City": "TP. Hồ Chí Minh",
    "Da Nang": "Đà Nẵng",
    "Can Tho": "Cần Thơ",
  };

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final date = DateFormat('dd-MM-yyyy').format(now);
    final time = DateFormat('HH:mm').format(now);

    String displayName = cityVietnamese[nameLocation] ?? nameLocation;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Location
        Row(
          children: [
            Image.asset('assets/images/weather/vitri.png', height: 22),
            const SizedBox(width: 6),
            Text(
              displayName,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        ///Date + Time
        Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Text(
            '$date | $time',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ),
      ],
    );
  }
}
