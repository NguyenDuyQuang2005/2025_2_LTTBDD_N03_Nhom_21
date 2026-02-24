import 'package:btltodolist/app/utils/asset.dart';
import 'package:flutter/material.dart';

class HomeWeather extends StatelessWidget {
  const HomeWeather({super.key, required this.nameIcon});

  final String nameIcon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: 100,
      padding: EdgeInsets.all(20.0),
      child: Image.asset(AssetCustom.getLinkImg(nameIcon), fit: BoxFit.cover),
    );
  }
}
