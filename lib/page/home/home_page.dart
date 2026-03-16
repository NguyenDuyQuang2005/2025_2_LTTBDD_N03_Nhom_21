import 'package:btltodolist/page/home/widget/home_date.dart';
import 'package:btltodolist/page/home/widget/home_detail2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:btltodolist/models/weather.dart';
import 'package:btltodolist/providers/weather_provider.dart';
import 'package:btltodolist/page/home/widget/home_detailsweather.dart';
import 'package:btltodolist/page/home/widget/home_temperature.dart';

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
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF86B0DE), Color(0xFF6FA0D6), Color(0xFF4A7FC1)],
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

              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),

                        child: Text(
                          'Quang Quốc Weather',
                          style: TextStyle(
                            fontSize: 24,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      HomeDate(nameLocation: data.name),
                      SizedBox(height: 15),
                      HomeTemperature(
                        temp: data.main.temp,
                        nameIcon: data.weather[0].main,
                        tempMin: data.main.tempMin,
                        tempMax: data.main.tempMax,
                        feelsLike: data.main.feelsLike,
                      ),

                      const SizedBox(height: 30),

                      HomeDetails(
                        wind: data.wind.speed,
                        humidity: data.main.humidity,
                      ),
                      SizedBox(height: 20),
                      HomeDetails2(
                        wind: data.wind.speed,
                        pressure: data.main.pressure,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
