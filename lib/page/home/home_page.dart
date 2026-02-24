import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:btltodolist/models/weather.dart';
import 'package:btltodolist/providers/weather_provider.dart';
import 'package:btltodolist/page/home/widget/home_detailsweather.dart';
import 'package:btltodolist/page/home/widget/home_location.dart';
import 'package:btltodolist/page/home/widget/home_temperature.dart';
import 'package:btltodolist/page/home/widget/home_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WeatherData> _weatherFuture;

  @override
  void initState() {
    super.initState();
    _weatherFuture = context.read<WeatherProvider>().getWeatherCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff3A8DFF), Color(0xff1E3C72)],
          ),
        ),
        child: FutureBuilder<WeatherData>(
          future: _weatherFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Lỗi: ${snapshot.error}'));
            }

            if (!snapshot.hasData) {
              return const Center(child: Text('Không có dữ liệu'));
            }

            final data = snapshot.data!;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dự báo thời tiết',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                HomeWeather(nameIcon: data.weather[0].main),
                HomeTemperature(temp: data.main.temp),
                const SizedBox(height: 10),
                HomeLocation(nameLocation: data.name),
                const SizedBox(height: 40),
                HomeDetails(
                  wind: data.wind.speed,
                  humidity: data.main.humidity,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
