import 'package:flutter/material.dart';
import 'package:utime/average_score.dart';
import 'package:utime/credits_number.dart';
import 'package:utime/timetables.dart';
import 'package:utime/utime_colors.dart';
import 'package:flutter/cupertino.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  static List<Widget> _pageList = [
    TimeTables(),
    CreditsNumber(),
    AverageScore()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '時間割'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), label: '単位'),
            BottomNavigationBarItem(icon: Icon(Icons.poll), label: '平均点'),
          ],
          activeColor: UtimeColors.tabAccent,
          height: 64,
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0: // 1番左のタブが選ばれた時の画面
              return TimeTables();
            case 1: // 真ん中のタブが選ばれた時の画面
              return CreditsNumber();
            case 2: // 1番右のタブが選ばれた時の画面
              return AverageScore();
            default:
              return TimeTables();
          }
        });
  }
}
/*
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '時間割'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: '単位'),
          BottomNavigationBarItem(icon: Icon(Icons.poll), label: '平均点'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: UtimeColors.tabAccent,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _selectedIndex = index;

          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        },
      ),
      */
    
