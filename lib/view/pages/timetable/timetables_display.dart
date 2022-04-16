import 'package:flutter/material.dart';
import 'package:utime/model/status_data.dart';
import 'package:utime/view/pages/Timetable/intensive_course_area.dart';
import 'package:utime/model/lecture_data.dart';
import 'package:utime/view/pages/Timetable/lecture_dialog.dart';
import 'package:utime/const/utime_colors.dart';
import 'package:utime/const/utime_text_styles.dart';
import 'package:utime/const/term.dart';
import 'package:utime/model/timetables_data.dart';
import 'package:utime/view/widgets/modal_overlay.dart';

class TimetablesDisplay extends StatefulWidget {
  const TimetablesDisplay({Key? key}) : super(key: key);

  @override
  State<TimetablesDisplay> createState() => _TimetablesDisplayState();
}

class _TimetablesDisplayState extends State<TimetablesDisplay> {
  //表示する時間割データ
  TimetablesData timetablesData = TimetablesData();
  //ユーザーのステータスのデータ
  StatusData statusData = StatusData();
  //授業データ
  LectureData lectureData = LectureData();

  //サイズ
  double screenHeight = 0;
  double screenWidth = 0;
  double classHeight = 0;
  double classWidth = 0;
  double intensiveCourseWidth = 0;

  @override
  Widget build(BuildContext context) {
    //アップバーの高さを取得
    final double appBarHeight = AppBar().preferredSize.height;
    // デバイスの縦幅と横幅を取得する
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    //サイズ用の変数
    classHeight =
        (screenHeight - appBarHeight - 64 - 50 - 60 - 24 - 108) / 6; //1コマの高さ
    classWidth = (screenWidth - 64 - 48) / 5; //1コマの横幅
    intensiveCourseWidth = screenWidth - 36 - 28 - 32; //集中講義の横幅

    //表示するターム
    Term term = timetablesData.getTerm();

    return Scaffold(
      //ドロワー
      drawer: Drawer(
        child: _onMenuButtonTapped(),
      ),
      //アップバー
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: UtimeColors.textColor,
        ),
        centerTitle: true,
        title: const Text('時間割', style: UtimeTextStyles.appBarTitle),
        backgroundColor: UtimeColors.white,
        elevation: 0.0,
      ),
      //本体
      body: SingleChildScrollView(
        child: Container(
          color: UtimeColors.backgroundColor,
          child: Center(
            child: Column(
              children: [
                //ターム
                _showPeriod(timetablesData.getTerm()),
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
                    //時間・時限
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
                          _period(term, '1'), //1時間目の組
                          const SizedBox(height: 12),
                          _period(term, '2'), //2時間目の組
                          const SizedBox(height: 12),
                          _period(term, '3'), //3時間目の組
                          const SizedBox(height: 12),
                          _period(term, '4'), //4時間目の組
                          const SizedBox(height: 12),
                          _period(term, '5'), //5時間目の組
                          const SizedBox(height: 12),
                          _period(term, '6'), //6時間目の組
                        ],
                      ),
                    )
                  ],
                ),
                //集中講義
                _showIntensiveCourseArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //タームを表示
  Container _showPeriod(Term term) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(term.label,
            textAlign: TextAlign.center,
            style: UtimeTextStyles.TimetablesDisplayTerm));
  }

  //曜日のウィジェット
  SizedBox _day(String day) {
    return (SizedBox(
      width: classWidth,
      child: Text(
        day,
        textAlign: TextAlign.center,
        style: UtimeTextStyles.TimetablesDisplayDay,
      ),
    ));
  }

  //時間割の区切りの時間を表示するウィジェット
  Text _time(String time) {
    return (Text(
      time,
      textAlign: TextAlign.center,
      style: UtimeTextStyles.TimetablesDisplayTime,
    ));
  }

  //何限かを表示するウィジェット
  Container _periodNumber(String period) {
    return (Container(
      width: 24,
      height: classHeight - 20,
      alignment: Alignment.center,
      child: Text(
        period,
        style: UtimeTextStyles.TimetablesDisplayPeriod,
      ),
    ));
  }

  ///1コマのウィジェット
  SizedBox _lecture(Term term, String day, String period) {
    String yearTerm = timetablesData.getYearTerm(statusData.getGrade(), 's1');
    Map<String, dynamic> lectureBoxData = timetablesData.getLectureBoxData(
        statusData.getCourse(), yearTerm, day, period);
    return (SizedBox(
      width: classWidth,
      height: classHeight,
      child: ElevatedButton(
        child: Text(
          lectureBoxData["lectureName"],
          style: UtimeTextStyles.TimetablesDisplayLectureName,
        ),
        style: ElevatedButton.styleFrom(
          primary: lectureBoxData["lectureColor"],
          elevation: 0,
        ),
        onPressed: () {
          _showLectureDialog(day, period);
        },
      ),
    ));
  }

  ///コマを何限かによって行でまとめたウィジェット
  SizedBox _period(Term term, String period) {
    return (SizedBox(
      child: Row(
        children: [
          _lecture(term, 'Mon', period),
          const SizedBox(width: 12),
          _lecture(term, 'Tue', period),
          const SizedBox(width: 12),
          _lecture(term, 'Wed', period),
          const SizedBox(width: 12),
          _lecture(term, 'Tur', period),
          const SizedBox(width: 12),
          _lecture(term, 'Fri', period),
        ],
      ),
    ));
  }

  //集中講義エリアを表示
  _showIntensiveCourseArea() {
    IntensiveCourseArea intensiveCourseArea = IntensiveCourseArea(context);
    return intensiveCourseArea.showIntensiveCourseArea();
  }

  _showLectureDialog(String day, String period) {
    Navigator.push(
        context,
        ModalOverlay(
          LectureDialog(day: day, period: period),
          //backボタンを有効にするかどうか
          isAndroidBackEnable: true,
        ));
  }

  //メニューボタンをタップした時
  _onMenuButtonTapped() {
    return (ListView(children: <Widget>[
      const SizedBox(
        height: 64,
        width: 160,
        child: DrawerHeader(
          child:
              Text('UTime', style: UtimeTextStyles.TimetablesDisplayMenuTitle),
          decoration: BoxDecoration(
            color: UtimeColors.white,
            border: Border(
              bottom: BorderSide(color: UtimeColors.menuAccent),
            ),
          ),
        ),
      ),
      const ListTile(
        title: Text('1年', style: UtimeTextStyles.TimetablesDisplayMenuGrade),
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
        Navigator.pop(context);
      },
    ));
  }
}
