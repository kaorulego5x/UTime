import 'package:flutter/material.dart';
import 'package:utime/const/utime_colors.dart';

class CustomButton extends StatelessWidget {
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed,
      style: ElevatedButton.styleFrom(
        // TODO: Implement Color
        primary: UtimeColors.subject1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
