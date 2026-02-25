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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
    };
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'humidity': humidity,
    };
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'speed': speed, 'deg': deg, 'gust': gust};
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'weather': weather.map((w) => w.toMap()).toList(),
      'base': base,
      'main': main.toMap(),
      'visibility': visibility,
      'wind': wind.toMap(),
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());
}

class WeatherDetail {
  Main main;
  Weather weather;
  String dt_txt;

  WeatherDetail({
    required this.main,
    required this.weather,
    required this.dt_txt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'main': main.toMap(),
      'weather': weather.toMap(),
      'dt_txt': dt_txt,
    };
  }

  factory WeatherDetail.fromMap(Map<String, dynamic> map) {
    return WeatherDetail(
      main: Main.fromMap(map['main'] as Map<String, dynamic>),
      weather: Weather.fromMap(map['weather'][0] as Map<String, dynamic>),
      dt_txt: map['dt_txt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherDetail.fromJson(String source) =>
      WeatherDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}
