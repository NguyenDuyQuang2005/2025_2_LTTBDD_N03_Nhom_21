import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const linkAsset = 'assets/images/icons/';

class AssetCustom {
  //  static String getLinkImg(String nameIcon) =>
  //     '$linkAsset${nameIcon.replaceAll(' ', '_').toLowerCase()}.png';
  static String getLinkImg(String nameIcon) {
    if (nameIcon.toLowerCase() == 'rain') {
      return '${linkAsset}clouds.png'; // Dùng heavyrain thay thế
    }
    return '$linkAsset${nameIcon.replaceAll(' ', '_').toLowerCase()}.png';
  }
}

class MyKey {
  static const String api_key = 'dbcf35c98686fa109a055987717c0478';
}

Widget createTemp(num temp, {double size = 100}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        temp.round().toString(),
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Text(
        "°C",
        style: TextStyle(fontSize: size / 3, color: Colors.white),
      ),
    ],
  );
}
