import 'package:btltodolist/app/utils/asset.dart';
import 'package:flutter/material.dart';

class HomeWeather extends StatelessWidget {
  const HomeWeather({super.key, required this.nameIcon});

  final String nameIcon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      width: size.width * 0.4, // 40% chiều ngang màn hình
      height: size.width * 0.4,
      child: Image.asset(AssetCustom.getLinkImg(nameIcon), fit: BoxFit.contain),
    );
  }
}
