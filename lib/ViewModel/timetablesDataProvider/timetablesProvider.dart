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

final timeTablesDisplayProvider =
    StateNotifierProvider<TimetablesDataNotifier, TimetablesData>((ref) {
  return TimetablesDataNotifier();
});

@freezed
class TimetablesData with _$TimetablesData {
  const factory TimetablesData({
    @Default(UserData.defaultTermTimetablesDisplay) Map lectureDataDisplay,
    @Default('') String yearTerm,
    @Default(UtimeColors.subject7) Color lectureDialogColor,
    @Default(<bool>[true, false]) List<bool> selectedClassTime,
  }) = _TimetablesData;
}

class TimetablesDataNotifier extends StateNotifier<TimetablesData> {
  TimetablesDataNotifier() : super(const TimetablesData());

  ///
  /// Timetable Data
  ///

  /// データ取得
  void getTimetablesDataDisplay(String yearTerm) async {
    UserData userData = UserData();
    final Map timetablesData = await userData.getTermTimetablesDisplay(yearTerm);
    print('Hello');
    print(timetablesData);
    print('Hello');
    state = state.copyWith(lectureDataDisplay: timetablesData);
  }

  ///
  /// LectureDialog
  ///

  /// Change subject Type
  void changeSubjectType(String newValue, String day, String period) {
    final Map newLectureData = {...state.lectureDataDisplay};
    newLectureData[day][period]['subjectType'] = newValue;
    state = state.copyWith(lectureDataDisplay: newLectureData);
  }

  /// Change Lecture Name
  void changeLectureName(String newValue, String day, String period) {
    final Map newLectureData = {...state.lectureDataDisplay};
    newLectureData[day][period]['lectureName'] = newValue;
    state = state.copyWith(lectureDataDisplay: newLectureData);
  }

  void changeTeacherName(String newValue, String day, String period) {
    final Map<String, dynamic> newLectureData = {...state.lectureDataDisplay};
    newLectureData[day][period]['teacherName'] = newValue;
    state = state.copyWith(lectureDataDisplay: newLectureData);
  }

  /// Change classroom
  void changeClassroom(String newValue, String day, String period) {
    final Map newLectureData = {...state.lectureDataDisplay};
    newLectureData[day][period]['classroom'] = newValue;
    state = state.copyWith(lectureDataDisplay: newLectureData);
  }

  /// Change openTerm
  void changeOpenTerm(String newValue, String day, String period) {
    final Map newLectureData = {...state.lectureDataDisplay};
    newLectureData[day][period]['openTerm'] = newValue;
    state = state.copyWith(lectureDataDisplay: newLectureData);
  }

  /// Change creditNumber
  void changeCreditNumber(String newValue, String day, String period) {
    final Map newLectureData = {...state.lectureDataDisplay};
    newLectureData[day][period]['creditNumber'] = newValue;
    state = state.copyWith(lectureDataDisplay: newLectureData);
  }

  /// Change Notes
  void changeNotes(String newValue, String day, String period) {
    final Map newLectureData = {...state.lectureDataDisplay};
    newLectureData[day][period]['notes'] = newValue;
    state = state.copyWith(lectureDataDisplay: newLectureData);
  }

  /// Change classTime
  void changeClassTime(int index, String day, String period) {
    final Map newLectureData = {...state.lectureDataDisplay};
    final List<String> classTime = ['90', '105'];
    newLectureData[day][period]['classTime'] = classTime[index];
    state = state.copyWith(lectureDataDisplay: newLectureData);
  }

  /// Change selectedClassTime toggle Button の状態管理
  void changeSelectedClassTime(int index) {
    switch (index) {
      case (0):
        final List<bool> selectedClassTime = [true, false];
        state = state.copyWith(selectedClassTime: selectedClassTime);
        break;
      case (1):
        final List<bool> selectedClassTime = [false, true];
        state = state.copyWith(selectedClassTime: selectedClassTime);
        break;
      default:
        throw Exception('List index is out of range.');
    }
  }

  /// Change DialogColor
  void changeDialogColor(String day, String period) {
    final Map lectureData = {...state.lectureDataDisplay};
    final Map temp = lectureData[day] ?? {};
    final Map temp1 = temp[period] ?? {};
    final String subjectType = temp1['subjectType'] ?? '';

    if (subjectType == '基礎科目') {
      state = state.copyWith(lectureDialogColor: UtimeColors.subject1);
    } else if (subjectType == '総合科目L系列') {
      state = state.copyWith(lectureDialogColor: UtimeColors.subject2);
    } else if (subjectType == '総合科目A系列') {
      state = state.copyWith(lectureDialogColor: UtimeColors.subject3);
    } else if (subjectType == '総合科目B系列') {
      state = state.copyWith(lectureDialogColor: UtimeColors.subject3);
    } else if (subjectType == '総合科目C系列') {
      state = state.copyWith(lectureDialogColor: UtimeColors.subject3);
    } else if (subjectType == '総合科目E系列') {
      state = state.copyWith(lectureDialogColor: UtimeColors.subject5);
    } else if (subjectType == '総合科目F系列') {
      state = state.copyWith(lectureDialogColor: UtimeColors.subject5);
    } else if (subjectType == '展開科目') {
      state = state.copyWith(lectureDialogColor: UtimeColors.subject8);
    } else if (subjectType == '主題科目') {
      state = state.copyWith(lectureDialogColor: UtimeColors.subject6);
    } else {
      state = state.copyWith(lectureDialogColor: UtimeColors.subject7);
    }
  }

  /// 初期化
  void resetDialogData(String day, String period) {
    const Map newLectureData = UserData.defaultTimetable;
    final Map origin = state.lectureDataDisplay;
    origin[day][period] = newLectureData;
    state = state.copyWith(lectureDataDisplay: origin);
  }

  /// Get Data
  void getLectureData({
    required String yearTerm,
    required String day,
    required String period,
  }) {
    final UserData userData = UserData();
    userData
        .getTermTimetablesDisplay(yearTerm)
        .then((value) => state = state.copyWith(lectureDataDisplay: value));
  }

  /// setData
  void setDialogData({
    required String yearTerm,
    required String day,
    required String period,
  }) {
    final Map timetable = {...state.lectureDataDisplay}[day][period];
    final UserData userData = UserData();
    userData.setTimetable(
      timetable: timetable,
      yearTerm: yearTerm,
      day: day,
      period: period,
    );
  }
}
