import 'package:flutter/material.dart';

import 'package:utime/lecture_dialog.dart';
import 'package:utime/utime_colors.dart';

class TimeTables extends StatefulWidget {
  const TimeTables({Key? key}) : super(key: key);
  static const String routeName = '/timeTables';

  @override
  State<TimeTables> createState() => _TimeTablesState();
}

class _TimeTablesState extends State<TimeTables> {
  @override
  Widget build(BuildContext context) {
    // デバイスの縦幅と横幅を取得する
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    //サイズ用の変数
    final double classHeight = 54; //1コマの高さ
    final double classWidth = (screenWidth - 28); //1コマの横幅

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: UtimeColors.textColor,
        ),
        centerTitle: true,
        title: Text(
          '時間割',
          style: TextStyle(
            fontSize: 18,
            color: UtimeColors.textColor,
          ),
        ),
        backgroundColor: UtimeColors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: UtimeColors.backgroundColor,
          child: Center(
            child: Column(
              children: [
                //ターム
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'S1ターム',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: UtimeColors.textColor,
                    ),
                  ),
                ),
                //曜日
                Container(
                  width: double.infinity,
                  height: 24,
                  margin: const EdgeInsets.only(
                      left: 32.0, right: 32.0, bottom: 4.0),
                  child: Row(
                    children: [
                      _day('Mon'),
                      SizedBox(width: 12, child: Spacer()),
                      _day('Tue'),
                      SizedBox(width: 12, child: Spacer()),
                      _day('Wed'),
                      SizedBox(width: 12, child: Spacer()),
                      _day('Tur'),
                      SizedBox(width: 12, child: Spacer()),
                      _day('Fri'),
                    ],
                  ),
                ),
                //時間割
                Container(
                  child: Row(
                    children: [
                      //時間
                      Container(
                        width: 28,
                        height: 492,
                        child: Center(
                          child: Column(
                            children: [
                              _time('8:30'),
                              _periodNumber('1'),
                              _time('10:15'),
                              Spacer(),
                              _time('10:25'),
                              _periodNumber('2'),
                              _time('12:10'),
                              Spacer(),
                              _time('13:00'),
                              _periodNumber('3'),
                              _time('14:45'),
                              Spacer(),
                              _time('14:55'),
                              _periodNumber('4'),
                              _time('16:40'),
                              Spacer(),
                              _time('16:50'),
                              _periodNumber('5'),
                              _time('18:35'),
                              Spacer(),
                              _time('18:45'),
                              _periodNumber('6'),
                              _time('20:30'),
                            ],
                          ),
                        ),
                      ),
                      //コマ
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 492,
                          margin: const EdgeInsets.only(left: 4.0, right: 32.0),
                          child: Column(
                            children: [
                              _period(),
                              SizedBox(height: 12, child: Spacer()),
                              _period(),
                              SizedBox(height: 12, child: Spacer()),
                              _period(),
                              SizedBox(height: 12, child: Spacer()),
                              _period(),
                              SizedBox(height: 12, child: Spacer()),
                              _period(),
                              SizedBox(height: 12, child: Spacer()),
                              _period(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //集中講義
                Container(
                  height: 180,
                  margin: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    children: [
                      //集中コース
                      Container(
                        height: 16,
                        alignment: Alignment.center,
                        child: Text(
                          '集中コース',
                          style: TextStyle(
                            fontSize: 10,
                            color: UtimeColors.textColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          margin:
                              const EdgeInsets.only(left: 28.0, right: 28.0),
                          decoration: BoxDecoration(
                            color: UtimeColors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              _intensiveCourse(),
                              _intensiveCourse(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '時間割'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: '単位'),
          BottomNavigationBarItem(icon: Icon(Icons.poll), label: '平均点'),
        ],
        fixedColor: Color(0xFFED6969),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  //曜日のウィジェット（横幅infinity）
  Expanded _day(String day) {
    return (Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Text(
          day,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: UtimeColors.textColor,
          ),
        ),
      ),
    ));
  }

  //時間割の区切りの時間を表示するウィジェット
  Text _time(String time) {
    return (Text(
      time,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 10,
        color: UtimeColors.textColor,
      ),
    ));
  }

  //何限かを表示するWidget（とりあえず縦幅54px）
  Container _periodNumber(String period) {
    return (Container(
      width: 24,
      height: 54,
      alignment: Alignment.center,
      child: Text(
        period,
        style: TextStyle(
          fontSize: 12,
          color: UtimeColors.textColor,
        ),
      ),
    ));
  }

  //コマのウィジェット
  Expanded _createLecture() {
    return (Expanded(
      child: SizedBox(
        width: double.infinity,
        height: 68,
        child: ElevatedButton(
          child: Text(
            '',
            style: TextStyle(
              fontSize: 8,
              color: UtimeColors.textColor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: UtimeColors.white,
            elevation: 0,
          ),
          onPressed: () {
            LectureDialog(
              context,
            ).showLectureDialog();
          },
        ),
      ),
    ));
  }

  //コマを何限かによって行でまとめたウィジェット
  Expanded _period() {
    return (Expanded(
      child: SizedBox(
        width: double.infinity,
        height: 68,
        child: Row(
          children: [
            _createLecture(),
            SizedBox(width: 12, child: Spacer()),
            _createLecture(),
            SizedBox(width: 12, child: Spacer()),
            _createLecture(),
            SizedBox(width: 12, child: Spacer()),
            _createLecture(),
            SizedBox(width: 12, child: Spacer()),
            _createLecture(),
          ],
        ),
      ),
    ));
  }

  //集中コースの授業のウィジェット
  Expanded _intensiveCourse() {
    return Expanded(
      child: (Container(
        width: double.infinity,
        height: 32,
        margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: ElevatedButton(
          child: Text(
            '全学自由研究ゼミナール',
            style: TextStyle(
              fontSize: 10,
              color: UtimeColors.textColor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: UtimeColors.subject6,
            elevation: 0,
          ),
          onPressed: () {},
        ),
      )),
    );
  }
}
