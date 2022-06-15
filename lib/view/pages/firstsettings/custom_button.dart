import 'package:flutter/material.dart';
import 'package:utime/const/utime_colors.dart';

class CustomButton extends StatelessWidget {
  final double? deviceWidth;
  final double width;
  final double height;
  final String text;
  final void Function() onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    required this.onPressed,
    this.deviceWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // TODO: Implement Color
        primary: UtimeColors.subject1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 100,
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class SettingTitle extends StatelessWidget {
  final String title;

  const SettingTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 30,
      ),
    );
  }
}

class SettingSubTitle extends StatelessWidget {
  const SettingSubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 8, bottom: 50),
      child: Text('設定から変更できます'),
    );
  }
}
