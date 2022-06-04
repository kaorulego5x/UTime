import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utime/const/term.dart';
import 'package:utime/const/utime_colors.dart';
import 'dart:convert';

import 'package:utime/model/user_data.dart';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utime/const/term.dart';
import 'package:utime/const/utime_colors.dart';
import 'package:utime/model/user_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:utime/provider.dart';

part 'timetablesProvider.freezed.dart';

final timeTablesDisplayProvider = StateNotifierProvider<TimetablesDataNotifier, TimetablesData>((ref) {
  return TimetablesDataNotifier();
});

@freezed
class TimetablesData with _$TimetablesData {
  const factory TimetablesData({
    @Default({}) Map lectureDataDisplay,
    @Default('') String yearTerm,
  }) = _TimetablesData;
}

class TimetablesDataNotifier extends StateNotifier<TimetablesData> {
  TimetablesDataNotifier() : super(const TimetablesData());

  void getTimetablesDataDisplay (String yearTerm) {
    UserData userData = UserData();
    userData.getTermTimetablesDisplay(yearTerm).then((Map value){
      state = state.copyWith(lectureDataDisplay: value);
    }, onError: (e){
      print(e);
    });
  }
}


/*
class TimetablesData {
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
}
 */