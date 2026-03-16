import 'package:btltodolist/app/utils/asset.dart';
import 'package:btltodolist/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key, required this.listData});

  final List<WeatherDetail> listData;
  static const Map<String, String> weatherToVietnamese = {
    "Clear": "Trời quang ",
    "Clouds": "Nhiều mây",
    "Rain": "Mưa",
    "Drizzle": "Mưa phùn",
    "Thunderstorm": "Giông bão",
    "Snow": "Tuyết",
    "Mist": "Sương mù",
    "Smoke": "Khói",
    "Haze": "Sương mù nhẹ",
    "Dust": "Bụi",
    "Fog": "Sương mù dày đặc",
    "Sand": "Cát",
    "Ash": "Tro bụi",
    "Squall": "Gió giật mạnh",
    "Tornado": "Lốc xoáy",
  };
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20.0),
      itemBuilder: (context, index) {
        DateTime dateTime = DateTime.parse(listData[index].dt_txt);
        String formatDay = DateFormat('EEEE').format(dateTime);
        String formatTime = DateFormat('HH:mm').format(dateTime);
        String weatherMain =
            weatherToVietnamese[listData[index].weather.main] ??
            listData[index].weather.main;
        return Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        createTemp(listData[index].main.temp, size: 25),
                        SizedBox(width: 10),
                        Text(
                          weatherMain,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      formatDay,
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                    SizedBox(height: 10),
                    Text(
                      formatTime,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 4,
                child: Image.asset(
                  AssetCustom.getLinkImg(listData[index].weather.main),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, _) => SizedBox(height: 15),
      itemCount: listData.length,
    );
  }
}
