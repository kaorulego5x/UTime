import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:utime/const/term.dart';
import 'package:utime/const/utime_colors.dart';

import '../model/user_data.dart';

part 'lectureDialogDataProvider.freezed.dart';

/// Lecture Dialog の状態管理
final lectureDialogDataProvider =
    StateNotifierProvider<LectureDialogDataNotifier, LectureDialogData>((ref) {
  return LectureDialogDataNotifier();
});

@freezed
class LectureDialogData with _$LectureDialogData {
  const factory LectureDialogData({
    @Default({}) Map lectureData,
    @Default('') String day,
    @Default('') String period,
  }) = _LectureDialogData;
// LectureData
// key:
// lectureName,
// openTerm,
// subjectType,
// creditNumber,
// score,
// teacherName,
// classroom,
// notes,
// classTime,
// >>　followings are not sure.
// dialogColor,
// dropDownColor,
}

class LectureDialogDataNotifier extends StateNotifier<LectureDialogData> {
  LectureDialogDataNotifier() : super(const LectureDialogData());

  ///
  /// 変更部分
  ///

  /// Change subject Type
  void changeSubjectType(String newValue) {
    final Map newLectureData = {...state.lectureData};
    newLectureData['subjectType'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }

  /// Change Lecture Name
  void changeLectureName(String newValue) {
    final Map newLectureData = {...state.lectureData};
    newLectureData['lectureName'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }

  /// Change teacher Name
  void changeTeacherName(String newValue) {
    final Map<String, dynamic> newLectureData = {...state.lectureData};
    newLectureData['teacherName'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }

  /// Change classroom
  void changeClassroom(String newValue) {
    final Map newLectureData = {...state.lectureData};
    newLectureData['classroom'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }

  /// Change openTerm
  void changeOpenTerm(String newValue) {
    final Map newLectureData = {...state.lectureData};
    newLectureData['openTerm'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
    print(state);
  }

  /// Change CreditNumber
  void changeCreditNumber(String newValue) {
    final Map newLectureData = {...state.lectureData};
    newLectureData['creditNumber'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }

  /// Change Notes
  void changeNotes(String newValue) {
    final Map newLectureData = {...state.lectureData};
    newLectureData['notes'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }

  /// Change classTime
  void changeClassTime(String newValue) {
    final Map newLectureData = {...state.lectureData};
    newLectureData['classTime'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }

  /// Change Dialog Color
  void changeDialogColor(String newValue) {
    final Map newLectureData = {...state.lectureData};
    newLectureData['dialogColor'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }

  ///
  /// ゲット部分（ダイアログを開いたときにデータを取得する初期値）
  ///

  void getDialogData({
    required String yearTerm,
    required String day,
    required String period,
  }) {
    final UserData userData = UserData();
    userData
        .getTimetable(yearTerm, day, period)
        .then((value) => state = state.copyWith(lectureData: value));
  }

  ///
  ///  セット部分（ダイアログを閉じたとき）
  ///
  void setDialogData({
    required String yearTerm,
    required String day,
    required String period,
  }) {
    final Map timetable = {...state.lectureData};
    final UserData userData = UserData();
    userData.setTimetable(
      timetable: timetable,
      yearTerm: yearTerm,
      day: day,
      period: period,
    );
  }
}
