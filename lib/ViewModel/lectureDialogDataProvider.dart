import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:utime/const/utime_colors.dart';

part 'lectureDialogDataProvider.freezed.dart';

/// Lecture Dialog の状態管理
final lectureDialogDataProvider = StateNotifierProvider<LectureDialogDataNotifier, LectureDialogData>((ref) {
  return LectureDialogDataNotifier();
});

@freezed
class LectureDialogData with _$LectureDialogData {
  const factory LectureDialogData({
    @Default({}) Map<String, dynamic> lectureData,
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
  // dialogColor,
  // dropDownColor,
}

class LectureDialogDataNotifier extends StateNotifier<LectureDialogData> {
  LectureDialogDataNotifier() : super(const LectureDialogData());

  /// Change subject Type
  void changeSubjectType(String newValue) {
    final Map<String, dynamic> newLectureData = {...state.lectureData};
    newLectureData['subjectType'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }
  /// Change Lecture Name
  void changeLectureName (String newValue) {
    final Map<String, dynamic> newLectureData = {...state.lectureData};
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
    final Map<String, dynamic> newLectureData = {...state.lectureData};
    newLectureData['classroom'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }
  /// Change openTerm
  void changeOpenTerm(String newValue) {
    final Map<String, dynamic> newLectureData = {...state.lectureData};
    newLectureData['openTerm'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
    print(state);
  }
  /// Change CreditNumber
  void changeCreditNumber(String newValue) {
    final Map<String, dynamic> newLectureData = {...state.lectureData};
    newLectureData['creditNumber'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }
  /// Change Notes
  void changeNotes(String newValue) {
    final Map<String, dynamic> newLectureData = {...state.lectureData};
    newLectureData['notes'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }
  /// Change classTime
  void changeClassTime(String newValue) {
    final Map<String, dynamic> newLectureData = {...state.lectureData};
    newLectureData['classTime'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }
  /// Change Dialog Color
  void changeDialogColor(String newValue) {
    final Map<String, dynamic> newLectureData = {...state.lectureData};
    newLectureData['dialogColor'] = newValue;
    state = state.copyWith(lectureData: newLectureData);
  }

}



/// LectureDialog における開講科目名、教員名、教室のTextFormFieldの状態管理