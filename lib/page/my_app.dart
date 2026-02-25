import 'package:btltodolist/app/config/theme_custom.dart';
import 'package:btltodolist/page/bottom_navigation_custom/bottom_custom.dart';
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
      child: MaterialApp(
        theme: ThemeCustom.themeLight,
        debugShowCheckedModeBanner: false,
        home: const BottomNavigationCustom(),
      ),
    );
  }
}
