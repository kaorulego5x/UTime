//ユーザーの設定を保存したりするクラス
import 'package:utime/view/pages/credits/status_dialog.dart';

class Settings {
  String _grade = "1";
  String _course = "理科一類";

  //学年を返す
  getGrade() {
    return _grade; //書き出しを実装してください
  }

  //科類を返す
  getCourse() {
    return _course; //書き出しを実装してください
  }

  //科類を設定
  setCourse(String course) {
    _course = course; //上書きを実装してください
  }

  //表示する学年タームを返す
  getYearTerm() {
    return '1S1';
  }
}
