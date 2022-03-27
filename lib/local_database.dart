import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
// ↑ 使う全ファイルでこれを書いて！

// ありえるパラメータをリストにして、リストにないものは弾く処理
// TimeTable クラスにする？

class UserData {
  static Map defaultTimeTable = {
    "lectureName": "", // 任意の文字列（30文字以内？）
    "openTerm": "", // "s", "a", "s1", "s2", "a1", "a2", "w"
    "subjectType": "", // "kiso", "l", "a", "b", "c", "d", "e", "f", "shudai", "tenkai"
    "creditNumber": 0.0, // 1.0, 2.0
    "score": 0, // 0～100の整数
    "teacherName": "", // 任意の文字列（30文字以内？）
    "classroom": "", // 任意の文字列（30文字以内？）
    "notes": "", // 任意の文字列（100文字以内？）
    "classTime": 90 // 105
  };

  static Map defaultTimeTableList6 = {
    "1": defaultTimeTable,
    "2": defaultTimeTable,
    "3": defaultTimeTable,
    "4": defaultTimeTable,
    "5": defaultTimeTable,
    "6": defaultTimeTable,
  };

  static Map defaultTermTimeTables = {
    "Mon": defaultTimeTableList6,
    "Tue": defaultTimeTableList6,
    "Wed": defaultTimeTableList6,
    "Thu": defaultTimeTableList6,
    "Fri": defaultTimeTableList6,
    "intensive": []
  };

  static Map defaultTermTimeTablesList8 = {
    "1s1": defaultTermTimeTables,
    "1s2": defaultTermTimeTables,
    "1a1": defaultTermTimeTables,
    "1a2": defaultTermTimeTables,
    "2s1": defaultTermTimeTables,
    "2s2": defaultTermTimeTables,
    "2a1": defaultTermTimeTables,
    "2a2": defaultTermTimeTables,
  };

  // JSONの形式
  static Map defaultUserData = {
    "course": "l1", // "l2", "l3", "s1", "s2", "s3"
    "grade": "1", // "2"
    "selectedTerm": "s1", // "s2", "a1", "a2"
    "timeTables": defaultTermTimeTablesList8,
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
  Future<Map> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userString = prefs.getString("user") ?? jsonEncode(defaultUserData);
    Map userData = jsonDecode(userString);
    return userData;
  }

  /// Map型の userData を入れると文字列型にして"user"というkeyに保存
  void setUserData(userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userString = jsonEncode(userData);
    await prefs.setString("user", userString);   // ここawaitいるか分からない
  }



  /// 表示する時はこんな感じ（関数名はこうではなくそのまま取得できると思う）
  /// 「科類を取得 → 表示する」例
  Future<String> getCourse() async {
    String course = "";
    Map userData = await getUserData();
    course = userData["course"];
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

  Future<Map> getTermTimeTables(String? yearTerm) async {
    Map termTimeTable;
    Map userData = await getUserData();
    termTimeTable = userData["timeTables"][yearTerm];
    return termTimeTable;
  }


  Future<Map> getTimeTable(String? yearTerm, String? day, period) async {
    Map timeTable;
    Map userData = await getUserData();
    timeTable = userData["timeTables"][yearTerm][day][period];
    return timeTable;
  }

  void setTimeTable({Map? timeTable, String? yearTerm, String? day, String period = "0"}) async {
    Map userData = await getUserData();
    Map termTimeTables = userData["timeTables"][yearTerm];
    if(day == "intensive"){
      termTimeTables[day].add(timeTable);
    }else{
      termTimeTables[day][period] = timeTable;
    }
    setUserData(userData);
  }

}
