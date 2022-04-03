import 'package:flutter/material.dart';
import 'package:utime/lecture_dialog.dart';
import 'package:utime/utime_colors.dart';
import 'package:utime/utime_text_styles.dart';

class IntensiveCourseArea {
  BuildContext context;
  IntensiveCourseArea(this.context);

  Container showIntensiveCourseArea() {
    return //集中講義
        Container(
      margin: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          //「集中講義」
          Container(
            height: 16,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 4),
            child: const Text('集中講義',
                style: UtimeTextStyles.timeIntensiveAreaName),
          ),

          //集中講義エリア
          Container(
            margin: const EdgeInsets.only(left: 28.0, right: 28.0, bottom: 72),
            padding: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: UtimeColors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                //取っている集中講義
                ListView(
                  shrinkWrap: true,
                  children: _takenIntensiveCourseList(),
                ),
                //集中講義追加ボタン
                _addIntensiveCourse(),
              ],
            ),
          )
        ],
      ),
    );
  }

  ///取っている集中講義を表示
  _takenIntensiveCourse() {
    //要編集
    return _intensiveCourse('全学自由研究ゼミナール');
  }

  ///取っている集中講義のリスト
  List<Widget> _takenIntensiveCourseList() {
    List<Widget> contentWidgets = [];

    contentWidgets.add(_takenIntensiveCourse());

    return contentWidgets;
  }

  ///集中講義の授業のウィジェット
  Container _intensiveCourse(String title) {
    // デバイスの横幅を取得する
    final double screenWidth = MediaQuery.of(context).size.width;
    //集中講義の横幅
    final double intensiveCourseWidth = screenWidth - 36 - 28 - 32;

    return (Container(
      width: intensiveCourseWidth,
      height: 32,
      margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: ElevatedButton(
        child: Text(title, style: UtimeTextStyles.timeIntensiveLectureName),
        style: ElevatedButton.styleFrom(
          primary: UtimeColors.subject6,
          elevation: 0,
        ),
        onPressed: () {
          LectureDialog(
            context,
          ).showTakenLectureDialog('intensive', '');
        },
      ),
    ));
  }

  ///集中講義追加ボタン
  Container _addIntensiveCourse() {
    // デバイスの横幅を取得する
    final double screenWidth = MediaQuery.of(context).size.width;
    //集中講義の横幅
    final double intensiveCourseWidth = screenWidth - 36 - 28 - 32;

    return (Container(
      width: intensiveCourseWidth,
      height: 32,
      margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: IconButton(
        iconSize: 24,
        color: UtimeColors.intensiveAdd,
        icon: const Icon(Icons.add_circle_outline),
        onPressed: () {
          LectureDialog(
            context,
          ).showDefaultLectureDialog('intensive', '');
        },
      ),
    ));
  }
}
