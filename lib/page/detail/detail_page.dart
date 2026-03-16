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
          colors: [Color(0xFF86B0DE), Color(0xFF5F8FC6)],
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
          final List<String> availableTimes = [
            '00:00',
            '03:03',
            '06:06',
            '09:09',
            '12:12',
            '15:15',
            '18:18',
            '21:21',
          ];
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
                    'Hà Nội',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              actions: [
                PopupMenuButton<String>(
                  icon: const Icon(CupertinoIcons.search, color: Colors.white),
                  tooltip: 'Tìm kiếm theo giờ',
                  onSelected: (String selectedTime) {
                    debugPrint('Bạn đã chọn: $selectedTime');
                  },
                  itemBuilder: (BuildContext context) {
                    return availableTimes.map((String time) {
                      return PopupMenuItem<String>(
                        value: time,
                        child: Text(time),
                      );
                    }).toList();
                  },
                ),
                const SizedBox(width: 15),
              ],
            ),
            body: DetailBody(listData: listData),
          );
        },
      ),
    );
  }
}
