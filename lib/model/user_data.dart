import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
// ↑ 使う全ファイルでこれを書いて！

// ありえるパラメータをリストにして、リストにないものは弾く処理
// Timetable クラスにする？

class UserData {
  static Map<String, dynamic> defaultTimetable = {
    "lectureName": "", // 任意の文字列（30文字以内？）
    "openTerm": "選択して下さい", // "s", "a", "s1", "s2", "a1", "a2", "w"
    "subjectType":
        "選択して下さい", // "kiso", "l", "a", "b", "c", "d", "e", "f", "shudai", "tenkai"
    "creditNumber": "選択して下さい", // 1.0, 2.0
    "score": 0, // 0～100の整数
    "teacherName": "", // 任意の文字列（30文字以内？）
    "classroom": "", // 任意の文字列（30文字以内？）
    "notes": "", // 任意の文字列（100文字以内？）
    "classTime": '90' // 105
  };

  static Map defaultTimetableList6 = {
    "1": defaultTimetable,
    "2": defaultTimetable,
    "3": defaultTimetable,
    "4": defaultTimetable,
    "5": defaultTimetable,
    "6": defaultTimetable,
  };

  static Map defaultTermTimetablesDisplay = {
    "Mon": defaultTimetableList6,
    "Tue": defaultTimetableList6,
    "Wed": defaultTimetableList6,
    "Thu": defaultTimetableList6,
    "Tur": defaultTimetableList6,
    "Fri": defaultTimetableList6,
    "intensive": []
  };

  static Map defaultTermTimetablesDisplayList8 = {
    "1s1": defaultTermTimetablesDisplay,
    "1s2": defaultTermTimetablesDisplay,
    "1a1": defaultTermTimetablesDisplay,
    "1a2": defaultTermTimetablesDisplay,
    "2s1": defaultTermTimetablesDisplay,
    "2s2": defaultTermTimetablesDisplay,
    "2a1": defaultTermTimetablesDisplay,
    "2a2": defaultTermTimetablesDisplay,
  };

  // JSONの形式
  static Map defaultUserData = {
    "course": "l1", // "l2", "l3", "s1", "s2", "s3"
    "grade": "1", // "2"
    "selectedTerm": "s1", // "s2", "a1", "a2"
    "TimetablesDisplay": defaultTermTimetablesDisplayList8,
  };

  /** 簡単な形で保存されてたらこれでいいけど、今回はJSON形式だから使えない */
  // Future<dynamic> getData(dataKey) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(dataKey);
  // }

  /** データごとに取得して、何もデータがなければそのデータのデフォルト値にする */
  // Future<String> getCourse() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("course") ?? "l1";
  // }

  /// 現在の "user"というkeyのvalueを取得（なければデフォルトのもの）にしてMap型の userData として取得
  Future<Map<String, dynamic>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userString = prefs.getString("user") ?? jsonEncode(defaultUserData);
    Map<String, dynamic> userData = jsonDecode(userString);
    return userData;
  }

  /// Map型の userData を入れると文字列型にして"user"というkeyに保存
  void setUserData(userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userString = jsonEncode(userData);
    await prefs.setString("user", userString); // ここawaitいるか分からない
  }

  /// 表示する時はこんな感じ（関数名はこうではなくそのまま取得できると思う）
  /// 「科類を取得 → 表示する」例
  Future<String> getCourse() async {
    Map userData = await getUserData();
    String course = userData["course"] ?? '';
    return course;
  }

  /// 保存する時はこんな感じ（関数名はこうではなくそのままできると思う）
  /// 一度 userData を取得してから、その中の科類の key に対する value を変更して「科類を保存する」例
  void setCourse(course) async {
    Map userData = await getUserData();
    userData["course"] = course;
    setUserData(userData);
  }

  Future<String> getGrade() async {
    String grade = "";
    Map userData = await getUserData();
    grade = userData["grade"];
    return grade;
  }

  void setGrade(grade) async {
    Map userData = await getUserData();
    userData["grade"] = grade;
    setUserData(userData);
  }

  Future<String> getSelectedTerm() async {
    String selectedTerm = "";
    Map userData = await getUserData();
    selectedTerm = userData["selectedTerm"];
    return selectedTerm;
  }

  void setSelectedTerm(selectedTerm) async {
    Map userData = await getUserData();
    userData["selectedTerm"] = selectedTerm;
    setUserData(userData);
  }

  Future<Map> getTermTimetablesDisplay(String? yearTerm) async {
    Map termTimetable;
    Map userData = await getUserData();
    termTimetable = userData["TimetablesDisplay"][yearTerm];
    return termTimetable;
  }

  Future<Map> getTimetable(String? yearTerm, String? day, period) async {
    Map timetable;
    Map userData = await getUserData();
    timetable = userData["TimetablesDisplay"][yearTerm][day][period];
    return timetable;
  }

  void setTimetable({
    required Map timetable,
    required String yearTerm,
    required String day,
    required String period,
  }) async {
    Map userData = await getUserData();
    Map termTimetablesDisplay = userData["TimetablesDisplay"][yearTerm];
    if (day == "intensive") {
      termTimetablesDisplay[day].add(timetable);
    } else {
      termTimetablesDisplay[day][period] = timetable;
    }
    setUserData(userData);
  }
}
