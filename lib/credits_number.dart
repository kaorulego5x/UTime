import 'package:flutter/material.dart';
import 'package:utime/utime_colors.dart';

class CreditsNumber extends StatefulWidget {
  const CreditsNumber({Key? key}) : super(key: key);
  static const String routeName = '/CreditsNumber';

  @override
  State<CreditsNumber> createState() => _CreditsNumberState();
}

class _CreditsNumberState extends State<CreditsNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '取得単位',
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
