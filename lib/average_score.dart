import 'package:flutter/material.dart';
import 'package:utime/utime_colors.dart';

class AverageScore extends StatefulWidget {
  const AverageScore({Key? key}) : super(key: key);
  static const String routeName = '/AverageScore';

  @override
  State<AverageScore> createState() => _AverageScoreState();
}

class _AverageScoreState extends State<AverageScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '平均点',
          style: TextStyle(
            fontSize: 18,
            color: UtimeColors.textColor,
          ),
        ),
        backgroundColor: UtimeColors.white,
        elevation: 0.0,
      ),
    );
  }
}
