import 'package:flutter/material.dart';
import 'package:btltodolist/page/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:btltodolist/providers/weather_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
