import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utime/model/settings.dart';
import 'package:utime/view/pages/average/coming_soon.dart';
import 'package:utime/view/pages/credits/credits_number.dart';
import 'package:utime/view/pages/Timetable/Timetables_display.dart';
import 'package:utime/const/utime_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart'; // 追記する

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Settings settings = Settings();
  @override
  Widget build(BuildContext context) {
    String yearTerm = settings.getYearTerm();
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 28,
                ),
                label: '時間割'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_balance,
                  size: 28,
                ),
                label: '単位'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.poll,
                  size: 28,
                ),
                label: '平均点'),
          ],
          activeColor: UtimeColors.tabAccent,
          backgroundColor: UtimeColors.white,
          border: const Border(top: BorderSide(color: UtimeColors.white)),
          height: 64,
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0: // 1番左のタブが選ばれた時の画面
              return const TimetablesDisplay();
            case 1: // 真ん中のタブが選ばれた時の画面
              return const CreditsNumber();
            case 2: // 1番右のタブが選ばれた時の画面
              return const ComingSoon();
            //実装したら以下のコメントアウトを外す
            //return const AverageScore();
            default:
              return const TimetablesDisplay();
          }
        });
  }
}
