import 'package:flutter/material.dart';
import 'package:utime/average_term.dart';
import 'package:utime/utime_colors.dart';
import 'package:utime/utime_text_styles.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);
  static const String routeName = '/AverageScore';

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '平均点',
          style: TextStyle(
            fontSize: 18,
            color: UtimeColors.textColor,
          ),
        ),
        backgroundColor: UtimeColors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: UtimeColors.lightGray,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.schedule),
                  onPressed: () {},
                  color: UtimeColors.darkGray,
                  iconSize: 60,
                ),
                const Text(
                  'Coming soon...!',
                  style: UtimeTextStyles.comingSoonText,
                ),
                const SizedBox(
                  height: 96,
                  child: Spacer(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
