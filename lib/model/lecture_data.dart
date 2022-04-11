import 'package:flutter/material.dart';
import 'package:utime/const/utime_colors.dart';

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

  ///subjectTypeに応じてdialogColorを返す
  Color getDialogColor(String course, String subjectType) {
    //文理共通
    if (subjectType == '基礎科目') {
      return UtimeColors.subject1;
    } else if (subjectType == 'L系列') {
      return UtimeColors.subject2;
    } else if (subjectType == 'A系列') {
      return UtimeColors.subject3;
    } else if (subjectType == 'B系列') {
      return UtimeColors.subject3;
    } else if (subjectType == 'C系列') {
      return UtimeColors.subject3;
    } else if (subjectType == 'E系列') {
      return UtimeColors.subject5;
    } else if (subjectType == 'F系列') {
      return UtimeColors.subject5;
    } else if (subjectType == '主題科目') {
      return UtimeColors.subject6;
    } else if (subjectType == '展開科目') {
      return UtimeColors.subject8;
    } else

    //文理共通でない
    if (course == '理科一類' || course == '理科二類' || course == '理科三類') {
      if (subjectType == 'D系列') {
        return UtimeColors.subject3;
      } else {
        throw Exception('subjectType is ' + subjectType);
      }
    } else if (course == '文科一類' || course == '文科二類' || course == '文科三類') {
      if (subjectType == 'D系列') {
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
}
