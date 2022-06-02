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
    @Default(UtimeColors.subject7) Color lectureDialogColor,
    @Default(<bool>[true, false]) List<bool> selectedClassTime,
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
// >>  no use
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
  void changeClassTime(int index) {
    final Map newLectureData = {...state.lectureData};
    final List<String> classTime = ['90', '105'];
    newLectureData['classTime'] = classTime[index];
    state = state.copyWith(lectureData: newLectureData);
  }

  /// Change selectedClassTime
  /// toggle Button の状態管理
  void changeSelectedClassTime(int index) {
    switch(index){
      case(0):
        final List<bool> selectedClassTime = [true, false];
        state = state.copyWith(selectedClassTime: selectedClassTime);
        break;
      case(1):
        final List<bool> selectedClassTime = [false, true];
        state = state.copyWith(selectedClassTime: selectedClassTime);
        break;
    }
    throw Exception('List index is out of range.');
  }


  ///
  /// 初期化
  ///

  void resetDialogData() {
    final Map newLectureData = UserData.defaultTimetable;
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

/// Dialog Color
final lectureDialogColorProvider = Provider<Color>((ref) {
  final String subjectType =
      ref.watch(lectureDialogDataProvider).lectureData['subjectType'] ?? '';

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
    //
  } else {
    //未定
    return UtimeColors.subject7;
  }
  // TODO:implement
  // lectureDialogData に　course　をもたせるか、？
  /*
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
   */
});
