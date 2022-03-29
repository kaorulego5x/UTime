import 'package:flutter/material.dart';

class UtimeColors {
  //背景
  static const backgroundColor = Color(0xFFE4F9FB);

  //タブのアクセントカラー
  static const tabAccent = Color(0xFFED6969);

  //白
  static const white = Color(0xFFFFFFFF);

  //メニューバーのアクセントカラー
  static const menuAccent = Color(0xFF50819C);
  //ラジオボタンのアクセントカラー
  static const radioAccent = Color(0xFF50819C);

  //文字の色
  //black80%
  static const textColor = Color(0xFF2E2E2E);
  //black50%
  static const lightTextColor = Color(0xFF808080);

  //科目区分
  //必修
  static const subject1 = Color(0xFFB1E3FF);
  //L系列
  static const subject2 = Color(0xFFFFF1A7);
  //理系A~D、文系A~C
  static const subject3 = Color(0xFFFFB1B5);
  //文系:社会科学、人文科学
  static const subject4 = Color(0xFFFFD3E0);
  //理系E~F、文系D~F
  static const subject5 = Color(0xFFE3CEF4);
  //集中講義
  static const subject6 = Color(0xFFC9F5AD);
  //未定（グレー）
  static const subject7 = Color(0xffd9d9d9);
  //展開科目
  static const subject8 = Color(0xFFFFD29D);

  //IntensiveCourseAreaの追加アイコンの色
  static const intensiveAdd = Color(0xffd9d9d9);
  //LectureDialogのゴミ箱アイコンの色
  static const deleteIcon = Color(0xffd9d9d9);

  ///dialogColorに応じてdropButtonColorを返す(途中)
  Color getDropDownColor(Color dialogColor) {
    if (dialogColor == UtimeColors.subject1) {
      return UtimeColors.subject1;
    } else if (dialogColor == UtimeColors.subject2) {
      return UtimeColors.subject2;
    } else if (dialogColor == UtimeColors.subject3) {
      return UtimeColors.subject3;
    } else if (dialogColor == UtimeColors.subject4) {
      return UtimeColors.subject4;
    } else if (dialogColor == UtimeColors.subject5) {
      return UtimeColors.subject5;
    } else if (dialogColor == UtimeColors.subject6) {
      return UtimeColors.subject6;
    } else if (dialogColor == UtimeColors.subject7) {
      return UtimeColors.subject7;
    } else if (dialogColor == UtimeColors.subject8) {
      return UtimeColors.subject8;
    } else {
      throw Exception('dialogcolor is $dialogColor');
    }
  }
}
