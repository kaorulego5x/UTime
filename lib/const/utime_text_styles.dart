import 'package:flutter/material.dart';
import 'package:utime/const/utime_colors.dart';

class UtimeTextStyles {
  //AppBarのタイトル
  static const appBarTitle = TextStyle(
    fontSize: 18,
    color: UtimeColors.textColor,
  );

  /// 時間割タブ

  //時間割タブのターム
  static const TimetablesDisplayTerm = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: UtimeColors.textColor,
  );

  //時間割タブの曜日
  static const TimetablesDisplayDay = TextStyle(
    fontSize: 12,
    color: UtimeColors.textColor,
  );

  //時間割タブの時間表示
  static const TimetablesDisplayTime = TextStyle(
    fontSize: 10,
    color: UtimeColors.textColor,
  );

  //時間割タブの時限
  static const TimetablesDisplayPeriod = TextStyle(
    fontSize: 12,
    color: UtimeColors.textColor,
  );

  //時間割タブの科目名
  static const TimetablesDisplayLectureName = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: UtimeColors.textColor,
  );

  //時間割タブの教員名
  static const timetablesDisplayClassroom = TextStyle(
    fontSize: 10,
  );

  //時間割タブの「集中講義」って書いてあるところ
  static const timeIntensiveAreaName = TextStyle(
    fontSize: 10,
    color: UtimeColors.textColor,
  );

  //時間割タブの集中講義名
  static const timeIntensiveLectureName = TextStyle(
    fontSize: 10,
    color: UtimeColors.textColor,
  );

  /// Drawer

  //ドロワーメニューのタイトル
  static const TimetablesDisplayMenuTitle = TextStyle(
    fontSize: 18,
    color: UtimeColors.menuAccent,
  );

  //ドロワーメニューの学年表示
  static const TimetablesDisplayMenuGrade = TextStyle(
    fontSize: 16,
    color: UtimeColors.menuAccent,
  );

  /// LectureDialog

  //LectureDialogの曜限
  static const lectureDialogDayPeriod = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: UtimeColors.white,
  );

  //LectureDialogの見出し
  static const lectureDialogTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: UtimeColors.white,
  );

  //LectureDialogの小見出し
  static const lectureDialogSectionName = TextStyle(
    fontSize: 10,
    color: UtimeColors.textColor,
  );

  //ComingSoonの文字
  static const comingSoonText = TextStyle(
    fontSize: 20,
    color: UtimeColors.lightTextColor,
  );

  //科類選択Radioの文字
  static const courseListText = TextStyle(
    fontSize: 16,
    color: UtimeColors.textColor,
  );
}
