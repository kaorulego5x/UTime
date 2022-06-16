import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utime/ViewModel/timetablesDataProvider/timetablesProvider.dart';
import 'package:utime/model/settings.dart';
import 'package:utime/view/pages/average/coming_soon.dart';
import 'package:utime/view/pages/credits/credits_number.dart';
import 'package:utime/const/utime_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:utime/view/pages/firstsettings/first_settings.dart';
import 'package:utime/view/pages/timetable/timetables_display.dart';
import 'package:utime/model/user_data.dart';

import 'const/pages.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  // 情報を取得するまでの待機画面
  Widget firstPage = const Scaffold(body: Center(child: CircularProgressIndicator()));

  @override
  void initState()  {
    super.initState();
    UserData userData = UserData();
    Future.delayed(const Duration(seconds: 2)).then((_) async {
      // データ取得
      String grade = await userData.getGrade();
      // 学年の情報があるかないかで場合分け
      final String yearTerm = ref.read(timeTablesDisplayProvider).yearTerm;
      ref.read(timeTablesDisplayProvider.notifier).getTimetablesDataDisplay(yearTerm);
      if (grade != "") {
        //　情報あるとき
        setState(() {
          firstPage = const HomePage();
        });
      } else {
        // 情報ないとき
        setState(() {
          firstPage = const GradeSelection();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTime',
      theme: ThemeData(
        fontFamily: "Noto Sans Japanese",
      ),
      routes: Pages.pages,
      home: firstPage,
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Settings settings = Settings();

  Widget firstPage = const GradeSelection();

  @override
  Widget build(BuildContext context) {
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
