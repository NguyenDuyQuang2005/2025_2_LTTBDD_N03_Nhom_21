import 'package:btltodolist/models/weather.dart';
import 'package:btltodolist/repon/api.dart';
import 'package:flutter/material.dart';

class WeatherProvider extends ChangeNotifier {
  Future<WeatherData> getWeatherCurrent() async {
    WeatherData weather = await Api.callApiGetWeather();
    return weather;
  }
}
