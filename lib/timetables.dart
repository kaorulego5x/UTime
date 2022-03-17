import 'package:flutter/material.dart';
import 'package:utime/average_score.dart';
import 'package:utime/credits_number.dart';

import 'package:utime/lecture_dialog.dart';
import 'package:utime/utime_colors.dart';
import 'package:utime/lecture_dialog.dart';

class TimeTables extends StatefulWidget {
  const TimeTables({Key? key}) : super(key: key);
  static const String routeName = '/timeTables';

  @override
  State<TimeTables> createState() => _TimeTablesState();
}

class _TimeTablesState extends State<TimeTables> {
  //表示しているターム
  var _term = '';

  //ドロップダウンボタンで使うやつ
  String? _SelectedKey = null;

  @override
  Widget build(BuildContext context) {
    //アップバーの高さを取得
    final double appBarHeight = AppBar().preferredSize.height;
    // デバイスの縦幅と横幅を取得する
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    //サイズ用の変数
    final double classHeight = 54; //1コマの高さ
    final double classWidth = (screenWidth - 28); //1コマの横幅

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: UtimeColors.textColor,
          ),
          //↓なんかこれ上手くいかないです、直せる方お願いします
          onPressed: () => _onMenuButtonTapped(),
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
      drawer: Drawer(
        child: _onMenuButtonTapped(),
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
                  child: DropdownButton<dynamic>(
                    hint: Text('S1ターム',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: UtimeColors.textColor,
                        )),
                    items: [
                      _dropdownMenuItem('S1'),
                      _dropdownMenuItem('S2'),
                      _dropdownMenuItem('A1'),
                      _dropdownMenuItem('A2'),
                    ],
                    value: _SelectedKey,
                    onChanged: (value) {
                      setState(() {
                        _SelectedKey = value ?? 'A';
                      });
                    },
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
                        margin: EdgeInsets.only(bottom: 4),
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

  //1コマのウィジェット
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
          onPressed: () {
            LectureDialog(
              context,
            ).showLectureDialog();
          },
        ),
      )),
    );
  }

  //メニューボタンをタップした時
  _onMenuButtonTapped() {
    return (ListView(children: <Widget>[
      SizedBox(
        height: 64,
        child: DrawerHeader(
          child: Text(
            'UTime',
            style: TextStyle(
              fontSize: 18,
              color: UtimeColors.menuAccent,
            ),
          ),
          decoration: BoxDecoration(
            color: UtimeColors.white,
            border: Border(
              bottom: BorderSide(color: UtimeColors.menuAccent),
            ),
          ),
        ),
      ),
      ListTile(
        title: Text('1年',
            style: TextStyle(
              fontSize: 16,
              color: UtimeColors.menuAccent,
            )),
      ),
      _listTitle('S1ターム', '1S1'),
      _listTitle('S2ターム', '1S2'),
      _listTitle('A1ターム', '1A1'),
      _listTitle('A2ターム', '1A2'),
      ListTile(
        title: Text('2年',
            style: TextStyle(
              fontSize: 16,
              color: UtimeColors.menuAccent,
            )),
      ),
      _listTitle('S1ターム', '2S1'),
      _listTitle('S2ターム', '2S2'),
      _listTitle('A1ターム', '2A1'),
      _listTitle('A2ターム', '2A2'),
    ]));
  }

  //メニューに表示されているリストの要素
  ListTile _listTitle(String t1, String t2) {
    return (ListTile(
      title: Text(t1),
      onTap: () {
        setState(() => _term = t2);
        Navigator.pop(context);
      },
    ));
  }

  //ドロップダウンボタンの選択肢
  DropdownMenuItem _dropdownMenuItem(String item) {
    return (DropdownMenuItem(
      child: Text(
        item,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          //fontWeight: FontWeight.bold,
          color: UtimeColors.textColor,
        ),
      ),
      value: item,
    ));
  }
}
