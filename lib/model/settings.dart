// ユーザーの設定を保存したりするクラス
import 'package:utime/view/pages/credits/status_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart'; // 追記する

class Settings {
  String _grade = "1";
  String _course = "理科一類";
  String _yearTerm = "1s1";

  // Shared Preferenceに値を保存されているデータを読み込んで_gradeにセットする。
  getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //見つからなければ''を返す
    _grade = prefs.getString('grade') ?? '';
    _course = prefs.getString('course') ?? '';
    _yearTerm = prefs.getString('yearTerm') ?? '';
  }

  // Shared Preferenceに値を保存されているデータを読み込んで_courseにセットする。
  readCourse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //見つからなければ''を返す
    _course = prefs.getString('course') ?? '';
  }

  // Shared Preferenceにデータを書き込む
  setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('grade', _grade);
    prefs.setString('course', _course);
    prefs.setString('yearTerm', _yearTerm);
  }

  // Shared Preferenceにデータを書き込む
  saveCourse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('course', _course);
  }

  //学年を返す
  getGrade() {
    return _grade; //書き出しを実装してください
  }

  //科類を返す
  getCourse() {
    readCourse();
    print("科類を読み込んだ結果：" + _course);
    return _course; //書き出しを実装してください
  }

  //科類を設定
  setCourse(String course) {
    _course = course; //上書きを実装してください
  }

  //表示する学年タームを返す
  getYearTerm() {
    return _yearTerm;
  }
}
