import 'package:flutter/material.dart';

class UtimeColors {
  //背景
  static const backgroundColor = Color(0xFFE6F8FC);

  //タブのアクセントカラー
  static const tabAccent = Color(0xFFED6969);

  //グレースケール
  //白
  static const white = Color(0xFFFFFFFF);
  //薄いグレー（Coming Soonの背景）
  static const lightGray = Color(0xffd9d9d9);
  //濃いグレー（Coming Soonの文字色）
  static const darkGray = Color(0xFF808080);

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
  static const darkSubject1 = Color(0xFFA3D4EF);
  //総合科目L系列
  static const subject2 = Color(0xFFFFF1A5);
  static const darkSubject2 = Color(0xFFF8E68A);
  //理系A~D、文系A~C
  static const subject3 = Color(0xFFFFD7E8);
  static const darkSubject3 = Color(0xFFF3C2D7);
  //文系:社会科学、人文科学
  static const subject4 = Color(0xFFFFB1B5);
  static const darkSubject4 = Color(0xFFF29CA0);
  //理系E~F、文系D~F
  static const subject5 = Color(0xFFE4DAFF);
  static const darkSubject5 = Color(0xFFD1C5F1);
  //主題科目
  static const subject6 = Color(0xFFCDEFC1);
  static const darkSubject6 = Color(0xFFB5DEA7);
  //未定（グレー）
  static const subject7 = Color(0xffd9d9d9);
  static const darkSubject7 = Color(0xFFC8C8C8);
  //展開科目
  static const subject8 = Color(0xFFFFDAAE);
  static const darkSubject8 = Color(0xFFF8CB96);

  //IntensiveCourseAreaの追加アイコンの色
  static const intensiveAdd = Color(0xffd9d9d9);
  //LectureDialogのゴミ箱アイコンの色
  static const deleteIcon = Color(0xffd9d9d9);

  //科類と科目区分を受け取って対応する色を返す
  Color getLectureColor(String course, String subjectType) {
    //全科類共通
    if (subjectType == '基礎科目') {
      return UtimeColors.subject1;
    } else if (subjectType == '総合科目L系列') {
      return UtimeColors.subject2;
    } else if (subjectType == '総合科目A系列') {
      return UtimeColors.subject3;
    } else if (subjectType == '総合科目B系列') {
      return UtimeColors.subject3;
    } else if (subjectType == '総合科目C系列') {
      return UtimeColors.subject3;
    } else if (subjectType == '総合科目E系列') {
      return UtimeColors.subject5;
    } else if (subjectType == '総合科目F系列') {
      return UtimeColors.subject5;
    } else if (subjectType == '展開科目') {
      return UtimeColors.subject8;
    } else if (subjectType == '主題科目') {
      return UtimeColors.subject6;
    } else if (subjectType == '') {
      //未定
      return UtimeColors.subject7;
    }

    //文理別
    if (course == '理科一類' || course == '理科二類' || course == '理科三類') {
      if (subjectType == '総合科目D系列') {
        return UtimeColors.subject3;
      }
    } else if (course == '文科一類' || course == '文科二類' || course == '文科三類') {
      if (subjectType == '総合科目D系列') {
        return UtimeColors.subject5;
      }
      if (subjectType == '人文科学') {
        return UtimeColors.subject4;
      }
      if (subjectType == '社会科学') {
        return UtimeColors.subject4;
      }
    }

    throw Exception('subjectType is ' + subjectType);
  }

  ///dialogColorに応じてdropButtonColorを返す(途中)
  Color getDropDownColor(Color dialogColor) {
    if (dialogColor == UtimeColors.subject1) {
      return UtimeColors.darkSubject1;
    } else if (dialogColor == UtimeColors.subject2) {
      return UtimeColors.darkSubject2;
    } else if (dialogColor == UtimeColors.subject3) {
      return UtimeColors.darkSubject3;
    } else if (dialogColor == UtimeColors.subject4) {
      return UtimeColors.darkSubject4;
    } else if (dialogColor == UtimeColors.subject5) {
      return UtimeColors.darkSubject5;
    } else if (dialogColor == UtimeColors.subject6) {
      return UtimeColors.darkSubject6;
    } else if (dialogColor == UtimeColors.subject7) {
      return UtimeColors.darkSubject7;
    } else if (dialogColor == UtimeColors.subject8) {
      return UtimeColors.darkSubject8;
    } else {
      throw Exception('dialogcolor is $dialogColor');
    }
  }
}
