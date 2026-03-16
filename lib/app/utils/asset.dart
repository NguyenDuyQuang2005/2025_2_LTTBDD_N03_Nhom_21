import 'package:flutter/material.dart';

const linkAsset = 'assets/images/icons/';

class AssetCustom {
  static String getLinkImg(String main) {
    switch (main.toLowerCase()) {
      case 'clear':
        return '${linkAsset}clear.png';

      case 'clouds':
        return '${linkAsset}cloudy.png';

      case 'rain':
        return '${linkAsset}lightrain.png';

      case 'drizzle':
        return '${linkAsset}heavyrain.png';

      case 'thunderstorm':
        return '${linkAsset}storm.png';

      case 'snow':
        return '${linkAsset}snow.png';

      case 'mist':
      case 'smoke':
      case 'haze':
      case 'fog':
      case 'dust':
      case 'sand':
      case 'ash':
        return '${linkAsset}mist.png';

      case 'squall':
        return '${linkAsset}wind.png';

      case 'tornado':
        return '${linkAsset}tornado.png';

      default:
        return '${linkAsset}default.png';
    }
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
