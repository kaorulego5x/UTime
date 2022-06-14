import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utime/const/term.dart';
import 'package:utime/const/utime_colors.dart';
import 'dart:convert';

import 'package:utime/model/user_data.dart';

class TimetablesContent {
  UserData userData = UserData();
  UtimeColors utimeColors = UtimeColors();

  getTimetableMap(String yearTerm) async {
    final Map termTimetable = await userData.getTermTimetablesDisplay(yearTerm);
    return termTimetable;
  }

  //現在表示するタームを返す
  /*getTerm() {
    Term term = Term.s1; //要編集
    return term;
  }*/

  //現在表示するタームの文字列を返す
  String getYearTermToShow() {
    YearTerm yearTerm = YearTerm.oneS1;
    return yearTerm.label;
  }

  //yearTermの文字列からuserdataのタグに変換
  String getYearTermData() {
    YearTerm yearTerm = YearTerm.oneS1;
    return yearTerm.key;
  }

  //１コマのデータを取ってくる
  _getLectureData(Map lectureData, String lectureName, String subjectType,
      String yearTerm, String day, String period) async {
    lectureData = await userData.getTimetable("1s1", day, period);
    lectureName = lectureData["lectureName"];
    subjectType = lectureData["subjectType"];
  }

  //ターム曜限に割り当てられた授業のタイトルと色を返す(一覧用)
  getLectureBoxData(String course, String yearTerm, String day, String period) {
    Map<String, dynamic> lectureData = {};
    String lectureName = '';
    String subjectType = '';
    _getLectureData(
        lectureData, lectureName, subjectType, yearTerm, day, period);

    Color lectureColor = utimeColors.getLectureColor(course, subjectType);
    //もしグレーだった場合は白に変更
    if (lectureColor == UtimeColors.subject7) {
      lectureColor = UtimeColors.white;
    }

    Map<String, dynamic> lectureBoxData = {
      'lectureName': lectureName,
      'lectureColor': lectureColor,
    };
    return lectureBoxData;
  }

  //科目区分を返す
  getSubjectType(String subjectType) {
    if (subjectType == 'kiso') {
      return '基礎科目';
    } else if (subjectType == 'l') {
      return '総合科目L系列';
    } else if (subjectType == 'a') {
      return '総合科目A系列';
    } else if (subjectType == 'b') {
      return '総合科目B系列';
    } else if (subjectType == 'c') {
      return '総合科目C系列';
    } else if (subjectType == 'd') {
      return '総合科目D系列';
    } else if (subjectType == 'e') {
      return '総合科目E系列';
    } else if (subjectType == 'f') {
      return '総合科目F系列';
    } else if (subjectType == '') {
      return '';
    }
  }
}
