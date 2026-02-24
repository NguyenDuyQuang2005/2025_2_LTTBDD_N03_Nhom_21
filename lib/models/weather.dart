import 'dart:convert';

class Weather {
  final int id;
  final String main;
  final String description;

  const Weather({
    required this.id,
    required this.main,
    required this.description,
  });

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id'] as int,
      main: map['main'] as String,
      description: map['description'] as String,
    );
  }
}

class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: (map['temp'] as num).toDouble(),
      feelsLike: (map['feels_like'] as num).toDouble(),
      tempMin: (map['temp_min'] as num).toDouble(),
      tempMax: (map['temp_max'] as num).toDouble(),
      humidity: map['humidity'] as int,
    );
  }
}

class Wind {
  final double speed;
  final int deg;
  final double gust;

  const Wind({required this.speed, required this.deg, required this.gust});

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: (map['speed'] as num).toDouble(),
      deg: map['deg'] as int,
      gust: (map['gust'] as num).toDouble(),
    );
  }
}

class WeatherData {
  final int id;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final String name;

  const WeatherData({
    required this.id,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.name,
  });

  factory WeatherData.fromMap(Map<String, dynamic> map) {
    return WeatherData(
      id: map['id'] as int,
      weather: (map['weather'] as List).map((e) => Weather.fromMap(e)).toList(),
      base: map['base'] as String,
      main: Main.fromMap(map['main']),
      visibility: map['visibility'] as int,
      wind: Wind.fromMap(map['wind']),
      name: map['name'] as String,
    );
  }

  factory WeatherData.fromJson(String source) =>
      WeatherData.fromMap(json.decode(source) as Map<String, dynamic>);
}
