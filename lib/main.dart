import 'package:flutter/material.dart';
import 'package:utime/timetables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTime',
      theme: ThemeData(
        fontFamily: "Noto Sans JP",
      ),
      home: TimeTables(),
    );
  }
}
