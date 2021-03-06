import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utime/main.dart';
import 'package:utime/model/settings.dart';
import 'package:utime/provider.dart';
import 'package:utime/view/pages/Timetable/intensive_course_area.dart';
import 'package:utime/view/pages/Timetable/lecture_dialog.dart';
import 'package:utime/const/utime_colors.dart';
import 'package:utime/const/utime_text_styles.dart';
import 'package:utime/ViewModel/timetablesDataProvider/timetablesProvider.dart';
import 'package:utime/view/widgets/modal_overlay.dart';

class TimetablesDisplay extends ConsumerStatefulWidget {
  const TimetablesDisplay({Key? key}) : super(key: key);

  @override
  ConsumerState<TimetablesDisplay> createState() => _TimetablesDisplayState();
}

class _TimetablesDisplayState extends ConsumerState<TimetablesDisplay> {
  //表示する時間割データ
  TimetablesData timetablesData = const TimetablesData();

  UtimeColors utimeColors = UtimeColors();

  //ユーザーのステータスのデータ
  Settings settings = Settings();

  //授業データ
  // LectureData lectureData = LectureData();

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
        (screenHeight - appBarHeight - 64 - 50 - 60 - 24 - 72) / 6; //1コマの高さ
    classWidth = (screenWidth - 64 - 24) / 5; //1コマの横幅
    intensiveCourseWidth = screenWidth - 36 - 28 - 32; //集中講義の横幅

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
        body: Consumer(builder: ((context, ref, child) {
          final String yearTerm = ref.read(yearProvider.state).state;

          return SingleChildScrollView(
            child: Container(
              color: UtimeColors.backgroundColor,
              child: Center(
                child: Column(
                  children: [
                    //ターム
                    _showPeriod(yearTerm),
                    //曜日
                    Container(
                      width: screenWidth,
                      height: 24,
                      margin: const EdgeInsets.only(left: 44.0, right: 20.0),
                      child: Row(
                        children: [
                          _day('Mon'),
                          const SizedBox(width: 6, child: Spacer()),
                          _day('Tue'),
                          const SizedBox(width: 6, child: Spacer()),
                          _day('Wed'),
                          const SizedBox(width: 6, child: Spacer()),
                          _day('Tur'),
                          const SizedBox(width: 6, child: Spacer()),
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
                          margin: const EdgeInsets.only(left: 12),
                          child: Center(
                            child: Column(
                              children: [
                                _time('8:30'),
                                _periodNumber('1'),
                                _time('10:15'),
                                const SizedBox(height: 4, child: Spacer()),
                                _time('10:25'),
                                _periodNumber('2'),
                                _time('12:10'),
                                const SizedBox(height: 4, child: Spacer()),
                                _time('13:00'),
                                _periodNumber('3'),
                                _time('14:45'),
                                const SizedBox(height: 4, child: Spacer()),
                                _time('14:55'),
                                _periodNumber('4'),
                                _time('16:40'),
                                const SizedBox(height: 4, child: Spacer()),
                                _time('16:50'),
                                _periodNumber('5'),
                                _time('18:35'),
                                const SizedBox(height: 4, child: Spacer()),
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
                          margin: const EdgeInsets.only(left: 4.0, right: 20.0),
                          child: Column(
                            children: [
                              _period(yearTerm, '1'), //1時間目の組
                              const SizedBox(height: 8),
                              _period(yearTerm, '2'), //2時間目の組
                              const SizedBox(height: 8),
                              _period(yearTerm, '3'), //3時間目の組
                              const SizedBox(height: 8),
                              _period(yearTerm, '4'), //4時間目の組
                              const SizedBox(height: 8),
                              _period(yearTerm, '5'), //5時間目の組
                              const SizedBox(height: 8),
                              _period(yearTerm, '6'), //6時間目の組
                            ],
                          ),
                        )
                      ],
                    ),
                    // 集中講義
                    // TODO:Implement This!!
                    // _showIntensiveCourseArea(),
                  ],
                ),
              ),
            ),
          );
        })));
  }

  //タームを表示
  Container _showPeriod(String yearTerm) {
    //タームのアルファベットを大文字に変える
    String termAlphabet = '';
    if (yearTerm[1] == 's') {
      termAlphabet = 'S';
    } else if (yearTerm[1] == 'a') {
      termAlphabet = 'A';
    }
    final String yearTermDisplay =
        yearTerm[0] + "年 " + termAlphabet + yearTerm[2] + "ターム";

    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(yearTermDisplay,
            textAlign: TextAlign.center,
            style: UtimeTextStyles.TimetablesDisplayTerm));
  }

  //曜日のウィジェット
  SizedBox _day(String day) {
    return SizedBox(
      width: classWidth,
      child: Text(
        day,
        textAlign: TextAlign.center,
        style: UtimeTextStyles.TimetablesDisplayDay,
      ),
    );
  }

  //時間割の区切りの時間を表示するウィジェット
  Text _time(String time) {
    return Text(
      time,
      textAlign: TextAlign.center,
      style: UtimeTextStyles.TimetablesDisplayTime,
    );
  }

  //何限かを表示するウィジェット
  Container _periodNumber(String period) {
    return Container(
      width: 24,
      height: classHeight - 20,
      alignment: Alignment.center,
      child: Text(
        period,
        style: UtimeTextStyles.TimetablesDisplayPeriod,
      ),
    );
  }

  SizedBox _oneLecture(String yearTerm, String day, String period) {
    return SizedBox(
        width: classWidth,
        height: classHeight,
        child: Consumer(
          builder: (context, ref, child) {
            return Card(
              elevation: 0,
              color: _oneLectureColor(yearTerm, day, period),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 授業名
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          ref
                                      .watch(timeTablesDisplayProvider)
                                      .lectureDataDisplay[day][period]
                                  ['lectureName'] ??
                              '',
                          style: UtimeTextStyles.TimetablesDisplayLectureName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                      // 教室名
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          ref
                                      .watch(timeTablesDisplayProvider)
                                      .lectureDataDisplay[day][period]
                                  ['classroom'] ??
                              '',
                          style: UtimeTextStyles.timetablesDisplayClassroom,
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    ref
                        .watch(timeTablesDisplayProvider.notifier)
                        .getLectureData(
                            yearTerm: yearTerm, day: day, period: period);
                    ref
                        .watch(timeTablesDisplayProvider.notifier)
                        .changeDialogColor(day, period);
                    _showLectureDialog(
                        day: day, period: period, yearTerm: yearTerm);
                  },
                ),
              ),
            );
          },
        ));
  }

  /// Dialogの色
  Color _oneLectureColor(String yearTerm, String day, String period) {
    Color lectureColor = utimeColors.getLectureColor(
      '理科一類',
      ref.watch(timeTablesDisplayProvider).lectureDataDisplay[day][period]
              ['subjectType'] ??
          '',
    );
    if (lectureColor == UtimeColors.subject7) {
      //未選択なら白
      lectureColor = UtimeColors.white;
    }
    return lectureColor;
    // TODO:implement
    // Courseをどのように管理するか未定のため。
    // lectureDialogData に　course　をもたせるか、？
  }

  ///コマを何限かによって行でまとめたウィジェット
  Row _period(String yearTerm, String period) {
    return Row(
      children: [
        _oneLecture(yearTerm, 'Mon', period),
        const SizedBox(width: 6),
        _oneLecture(yearTerm, 'Tue', period),
        const SizedBox(width: 6),
        _oneLecture(yearTerm, 'Wed', period),
        const SizedBox(width: 6),
        _oneLecture(yearTerm, 'Tur', period),
        const SizedBox(width: 6),
        _oneLecture(yearTerm, 'Fri', period),
      ],
    );
  }

  // 集中講義エリアを表示
  _showIntensiveCourseArea() {
    IntensiveCourseArea intensiveCourseArea =
        IntensiveCourseArea(context: context);
    return intensiveCourseArea.showIntensiveCourseArea();
  }

  _showLectureDialog({
    required String day,
    required String period,
    required String yearTerm,
  }) {
    Navigator.push(
      context,
      ModalOverlay(
        LectureDialog(day: day, period: period, yearTerm: yearTerm),
        // backボタンを有効にするかどうか
        isAndroidBackEnable: true,
      ),
    );
  }

  //メニューボタンをタップした時
  _onMenuButtonTapped() {
    return ListView(
      children: <Widget>[
        const SizedBox(
          height: 64,
          width: 160,
          child: DrawerHeader(
            child: Text('UTime',
                style: UtimeTextStyles.TimetablesDisplayMenuTitle),
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
        _listTitle('S1ターム', '1s1'),
        _listTitle('S2ターム', '1s2'),
        _listTitle('A1ターム', '1a1'),
        _listTitle('A2ターム', '1a2'),
        const ListTile(
          title: Text(
            '2年',
            style: TextStyle(
              fontSize: 16,
              color: UtimeColors.menuAccent,
            ),
          ),
        ),
        _listTitle('S1ターム', '2s1'),
        _listTitle('S2ターム', '2s2'),
        _listTitle('A1ターム', '2a1'),
        _listTitle('A2ターム', '2a2'),
      ],
    );
  }

  //メニューに表示されているリストの要素
  Consumer _listTitle(String t1, String t2) {
    //Providerを
    return Consumer(
      builder: (context, ref, child) {
        return ListTile(
          title: Text(t1),
          onTap: () {
            //要編集：設定にt2を渡す処理
            Navigator.pop(context);
            ref.read(yearProvider.state).state = t2;
            //描き直すべき？
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const MyApp();
                },
              ),
            );
            // データ取得
            ref
                .watch(timeTablesDisplayProvider.notifier)
                .getTimetablesDataDisplay(t2);
          },
        );
      },
    );
  }
}
