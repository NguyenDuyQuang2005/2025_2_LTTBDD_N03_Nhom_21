import 'package:flutter/material.dart';
import 'package:btltodolist/page/my_app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting('vi_VN');
  runApp(const MyApp());
}
