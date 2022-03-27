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
  //表示しているターム
  var _term = '';

  //サイズ
  var screenHeight;
  var screenWidth;
  var classHeight;
  var classWidth;
  var intensiveCourseWidth;

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
    classHeight =
        (screenHeight - appBarHeight - 64 - 50 - 60 - 24 - 60) / 6; //1コマの高さ
    classWidth = (screenWidth - 64 - 48) / 5; //1コマの横幅
    intensiveCourseWidth = screenWidth - 36 - 28 - 32; //集中コースの横幅

    return Scaffold(
      drawer: Drawer(
        child: _onMenuButtonTapped(),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: UtimeColors.textColor,
        ),
        centerTitle: true,
        title: const Text(
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
                _showPeriod('S1ターム'),
                //曜日
                Container(
                  width: screenWidth,
                  height: 24,
                  margin: const EdgeInsets.only(
                      left: 36.0, right: 28.0, bottom: 4.0),
                  child: Row(
                    children: [
                      _day('Mon'),
                      const SizedBox(width: 12, child: Spacer()),
                      _day('Tue'),
                      const SizedBox(width: 12, child: Spacer()),
                      _day('Wed'),
                      const SizedBox(width: 12, child: Spacer()),
                      _day('Tur'),
                      const SizedBox(width: 12, child: Spacer()),
                      _day('Fri'),
                    ],
                  ),
                ),
                //時間割
                Row(
                  children: [
                    //時間
                    Container(
                      width: 28,
                      margin: const EdgeInsets.only(left: 4),
                      child: Center(
                        child: Column(
                          children: [
                            _time('8:30'),
                            _periodNumber('1'),
                            _time('10:15'),
                            const SizedBox(height: 8, child: Spacer()),
                            _time('10:25'),
                            _periodNumber('2'),
                            _time('12:10'),
                            const SizedBox(height: 8, child: Spacer()),
                            _time('13:00'),
                            _periodNumber('3'),
                            _time('14:45'),
                            const SizedBox(height: 8, child: Spacer()),
                            _time('14:55'),
                            _periodNumber('4'),
                            _time('16:40'),
                            const SizedBox(height: 8, child: Spacer()),
                            _time('16:50'),
                            _periodNumber('5'),
                            _time('18:35'),
                            const SizedBox(height: 8, child: Spacer()),
                            _time('18:45'),
                            _periodNumber('6'),
                            _time('20:30'),
                          ],
                        ),
                      ),
                    ),
                    //コマ
                    Container(
                      width: screenWidth - 64,
                      margin: const EdgeInsets.only(left: 4.0, right: 28.0),
                      child: Column(
                        children: [
                          _period('1'),
                          const SizedBox(height: 12, child: Spacer()),
                          _period('2'),
                          const SizedBox(height: 12, child: Spacer()),
                          _period('3'),
                          const SizedBox(height: 12, child: Spacer()),
                          _period('4'),
                          const SizedBox(height: 12, child: Spacer()),
                          _period('5'),
                          const SizedBox(height: 12, child: Spacer()),
                          _period('6'),
                        ],
                      ),
                    )
                  ],
                ),
                //集中講義
                Container(
                  //height: 180,
                  margin: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    children: [
                      //集中コース
                      Container(
                        height: 16,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 4),
                        child: const Text(
                          '集中コース',
                          style: TextStyle(
                            fontSize: 10,
                            color: UtimeColors.textColor,
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth,
                        margin: const EdgeInsets.only(
                            left: 28.0, right: 28.0, bottom: 72),
                        padding: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: UtimeColors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: [
                            _intensiveCourse('全学自由研究ゼミナール'),
                            _intensiveCourse('全学自由研究ゼミナール'),
                          ],
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

  //タームを表示
  Container _showPeriod(String period) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(period,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: UtimeColors.textColor,
            )));
  }

  //曜日のウィジェット
  SizedBox _day(String day) {
    return (SizedBox(
      width: classWidth,
      child: Text(
        day,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 12,
          color: UtimeColors.textColor,
        ),
      ),
    ));
  }

  //時間割の区切りの時間を表示するウィジェット
  Text _time(String time) {
    return (Text(
      time,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 10,
        color: UtimeColors.textColor,
      ),
    ));
  }

  //何限かを表示するWidget（とりあえず縦幅54px）
  Container _periodNumber(String period) {
    return (Container(
      width: 24,
      height: classHeight - 20,
      alignment: Alignment.center,
      child: Text(
        period,
        style: const TextStyle(
          fontSize: 12,
          color: UtimeColors.textColor,
        ),
      ),
    ));
  }

  //1コマのウィジェット
  SizedBox _createLecture(String day, String period) {
    return (SizedBox(
      width: classWidth,
      height: classHeight,
      child: ElevatedButton(
        child: const Text(
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
          ).showLectureDialog(day, period);
        },
      ),
    ));
  }

  //コマを何限かによって行でまとめたウィジェット
  SizedBox _period(String period) {
    return (SizedBox(
      child: Row(
        children: [
          _createLecture('Mon', period),
          const SizedBox(width: 12, child: Spacer()),
          _createLecture('Tue', period),
          const SizedBox(width: 12, child: Spacer()),
          _createLecture('Wed', period),
          const SizedBox(width: 12, child: Spacer()),
          _createLecture('Tur', period),
          const SizedBox(width: 12, child: Spacer()),
          _createLecture('Fri', period),
        ],
      ),
    ));
  }

  //集中コースの授業のウィジェット
  Container _intensiveCourse(String title) {
    return (Container(
      width: intensiveCourseWidth,
      height: 32,
      margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: ElevatedButton(
        child: Text(
          title,
          style: const TextStyle(
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
          ).showLectureDialog('intensive', '');
        },
      ),
    ));
  }

  //メニューボタンをタップした時
  _onMenuButtonTapped() {
    return (ListView(children: <Widget>[
      const SizedBox(
        height: 64,
        width: 160,
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
      const ListTile(
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
      const ListTile(
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
        style: const TextStyle(
          fontSize: 18,
          //fontWeight: FontWeight.bold,
          color: UtimeColors.textColor,
        ),
      ),
      value: item,
    ));
  }
}
