import 'package:btltodolist/app/utils/asset.dart';
import 'package:btltodolist/models/weather.dart';
import 'package:dio/dio.dart';

class Api {
  static Future<WeatherData> callApiGetWeather() async {
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=21.0278&lon=105.8342&units=metric&appid=${MyKey.api_key}',
      );
      final data = response.data;
      WeatherData result = WeatherData.fromMap(data);
      return result;
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }

  static Future<List<WeatherDetail>> callApiGetWeatherDetail() async {
    try {
      final dio = Dio();
      final res = await dio.get(
        'https://api.openweathermap.org/data/2.5/forecast?lat=21.0278&lon=105.8342&units=metric&appid=${MyKey.api_key}',
      );
      List data = res.data['list'] as List<dynamic>;
      List<WeatherDetail> result = List<WeatherDetail>.from(
        data.map((e) => WeatherDetail.fromMap(e)).toList(),
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
