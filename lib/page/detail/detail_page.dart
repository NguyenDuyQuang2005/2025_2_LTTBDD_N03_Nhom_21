import 'package:btltodolist/page/detail/widgets/detail_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:btltodolist/providers/weather_provider.dart';
import 'package:btltodolist/models/weather.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff3A8DFF), Color(0xff1E3C72)],
        ),
      ),
      child: FutureBuilder(
        future: context.read<WeatherProvider>().getWeatherDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          List<WeatherDetail> listData = snapshot.data as List<WeatherDetail>;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: false,
              title: Row(
                children: [
                  Icon(CupertinoIcons.location),
                  SizedBox(width: 15),
                  Text(
                    'Ha Noi',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              actions: const [Icon(CupertinoIcons.search), SizedBox(width: 15)],
            ),
            body: DetailBody(listData: listData),
          );
        },
      ),
    );
  }
}
