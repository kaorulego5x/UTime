import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:utime/const/utime_colors.dart';

part 'lecture_data.freezed.dart';

@freezed
class TimetableData with _$TimetableData {
  const factory TimetableData({
    @Default({}) Map<String, String> lectureData,
    @Default('') String day,
    @Default('') String period,
  }) = _TimetableData;
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
  // dialogColor,
  // dropDownColor,
}

class TimetableDataNotifier extends StateNotifier<TimetableData> {
  TimetableDataNotifier() : super(const TimetableData());

  /// Change subject Type
  void changeSubjectType(String newValue) {
    final Map<String, String> newLectureData = state.lectureData;
    newLectureData['subjectType'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }
  /// Change Lecture Name
  void changeLectureName (String newValue) {
    final Map<String, String> newLectureData = state.lectureData;
    newLectureData['lectureName'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }
  /// Change teacher Name
  void changeTeacherName(String newValue) {
    final Map<String, String> newLectureData = state.lectureData;
    newLectureData['teacherName'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }
  /// Change classroom
  void changeClassroom(String newValue) {
    final Map<String, String> newLectureData = state.lectureData;
    newLectureData['classroom'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }
  /// Change openTerm
  void changeOpenTerm(String newValue) {
    final Map<String, String> newLectureData = state.lectureData;
    newLectureData['classroom'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }
  /// Change CreditNumber
  void changeCreditNumber(String newValue) {
    final Map<String, String> newLectureData = state.lectureData;
    newLectureData['classroom'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }
  /// Change Notes
  void changeNotes(String newValue) {
    final Map<String, String> newLectureData = state.lectureData;
    newLectureData['notes'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }
  /// Change classTime
  void changeClassTime(String newValue) {
    final Map<String, String> newLectureData = state.lectureData;
    newLectureData['classTime'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }
}

/// LectureDialog の開講科目名、教員名、教室の状態管理
final timeTableDataProvider = StateNotifierProvider<TimetableDataNotifier, TimetableData>((ref) {
  return TimetableDataNotifier();
});

final lectureDialogTitleProvider = StateProvider<String>((ref) {
  return '';
});

final lectureDialogTitleDataProvider = Provider<String>((ref) {
  final String lectureDialogTitle = ref.watch(lectureDialogTitleProvider);
  final Map<String, String> lectureDialogData = ref.watch(timeTableDataProvider).lectureData;
  switch(lectureDialogTitle) {
    case '開講科目名':
      return lectureDialogData['lectureName'] ?? '';
    case '教員名':
      return lectureDialogData['teacherName'] ?? '';
    case '教室':
      return lectureDialogData['classroom'] ?? '';

  }
});

/*
class LectureData {
  ///授業データを取得
  getLectureData(String day, String period) {
    Map lectureData = {
      'lectureName': '四次元ポケット基礎',
      'openTerm': 's',
      'subjectType': 'd',
      'creditsNumber': 2.0,
      'score': 50,
      'teacherName': 'ドラえもん',
      'classroom': '1121',
      'notes': 'あいうえお',
      'classTime': 90,
      'dialogColor': UtimeColors.subject3,
      'dropdownColor': UtimeColors.subject4
    };
    return lectureData;
  }

  ///集中講義データを取得
  getIntensiveCourseData(String day, String period) {
    Map intensiveCourseData = {
      'lectureName': '全学自由研究ゼミナール（アプリ開発概論）',
      'openTerm': 'a',
      'subjectType': 'intensive',
      'creditsNumber': 2.0,
      'score': 0,
      'teacherName': 'ドラえもん',
      'classroom': '1121',
      'notes': 'あいうえお',
      'classTime': 90,
      'dialogColor': UtimeColors.subject7,
      'dropdownColor': UtimeColors.subject7
    };
    return intensiveCourseData;
  }

  ///デフォルトの授業データを取得
  getDefaultLectureData(String day, String period) {
    Map lectureData = {
      'lectureName': '',
      'openTerm': '',
      'subjectType': '',
      'creditsNumber': 2.0,
      'score': 0,
      'teacherName': '',
      'classroom': '',
      'notes': '',
      'classTime': 90,
      'dialogColor': UtimeColors.subject7,
      'dropdownColor': UtimeColors.subject7
    };
    return lectureData;
  }

  ///デフォルトの授業データをセット
  setDefaultLectureData(Map lectureDataToReset) {
    lectureDataToReset['lectureName'] = '';
    lectureDataToReset['openTerm'] = '';
    lectureDataToReset['subjectType'] = '';
    lectureDataToReset['creditsNumber'] = 2.0;
    lectureDataToReset['score'] = 0;
    lectureDataToReset['teacherName'] = '';
    lectureDataToReset['classroom'] = '';
    lectureDataToReset['notes'] = '';
    lectureDataToReset['classTime'] = 90;
    lectureDataToReset['dialogColor'] = UtimeColors.darkSubject7;
    lectureDataToReset['lectureName'] = UtimeColors.darkSubject7;

    return lectureDataToReset;
  }

  ///subjectTypeに応じてdialogColorを返す
  Color getDialogColor(String course, String subjectType) {
    //文理共通
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
    } else if (subjectType == '主題科目') {
      return UtimeColors.subject6;
    } else if (subjectType == '展開科目') {
      return UtimeColors.subject8;
    } else

    //文理共通でない
    if (course == '理科一類' || course == '理科二類' || course == '理科三類') {
      if (subjectType == '総合科目D系列') {
        return UtimeColors.subject3;
      } else {
        throw Exception('subjectType is ' + subjectType);
      }
    } else if (course == '文科一類' || course == '文科二類' || course == '文科三類') {
      if (subjectType == '総合科目D系列') {
        return UtimeColors.subject5;
      } else {
        throw Exception('subjectType is ' + subjectType);
      }
    } else {
      throw Exception('course is ' + course);
    }
  }

  ///dialogColorに応じてdropButtonColorを返す
  Color getDropDownColor(Color dialogColor) {
    UtimeColors utimeColors = UtimeColors();
    return utimeColors.getDropDownColor(dialogColor);
  }

  //ここから下はゲッタ―
/*
  getTerm() {
    Map lectureData = _getLectureData();
    String term = lectureData['openTerm'];
    return term;
  }

  getLectureName() {
    Map lectureData = _getLectureData();
    String lectureName = lectureData['lectureName'];

    return lectureName;
  }

  getTeacherName() {
    Map lectureData = _getLectureData();
    String teacherName = lectureData['teacherName'];

    return teacherName;
  }

  getClassroom() {
    Map lectureData = _getLectureData();
    String classroom = lectureData['classroom'];

    return classroom;
  }

  getClassTime() {
    Map lectureData = _getLectureData();
    int classTime = lectureData['classTime'];

    return classTime;
  }
  */
}*/
