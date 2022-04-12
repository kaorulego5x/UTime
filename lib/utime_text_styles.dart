import 'package:flutter/material.dart';
import 'package:utime/utime_colors.dart';

class UtimeTextStyles {
  //AppBarのタイトル
  static const appBarTitle = TextStyle(
    fontSize: 18,
    color: UtimeColors.textColor,
  );

  //時間割タブのターム
  static const timeTablesTerm = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: UtimeColors.textColor,
  );

  //時間割タブの曜日
  static const timeTablesDay = TextStyle(
    fontSize: 12,
    color: UtimeColors.textColor,
  );

  //時間割タブの時間表示
  static const timeTablesTime = TextStyle(
    fontSize: 10,
    color: UtimeColors.textColor,
  );

  //時間割タブの時限
  static const timeTablesPeriod = TextStyle(
    fontSize: 12,
    color: UtimeColors.textColor,
  );

  //時間割タブの科目名
  static const timeTablesLectureName = TextStyle(
    fontSize: 8,
    color: UtimeColors.textColor,
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

  //ドロワーメニューのタイトル
  static const timeTablesMenuTitle = TextStyle(
    fontSize: 18,
    color: UtimeColors.menuAccent,
  );

  //ドロワーメニューの学年表示
  static const timeTablesMenuGrade = TextStyle(
    fontSize: 16,
    color: UtimeColors.menuAccent,
  );

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
}
