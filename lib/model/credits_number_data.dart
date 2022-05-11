import 'package:utime/model/arts.dart';
import 'package:utime/model/sciences.dart';

class CreditsNumberData {
  final String course;
  CreditsNumberData(this.course);

  ///ユーザーデータを取得
  getUserData() {
    Map<String, int> userData = {
      'kiso': 14,
      'seriesL': 4,
      'seriesA': 2,
      'seriesB': 2,
      'seriesC': 2,
      'seriesD': 2,
      'seriesE': 2,
      'seriesF': 2,
      'shudai': 2,
      'tenkai': 0,
      'all': 0
    };
    return userData;
  }

  ///取得した単位数のマップデータ
  getTakenUnits() {
    Map<String, int> userData = getUserData();
    //マップデータの値を合計
    int sum = userData.values.reduce((a, b) => a + b);
    int? all = userData['all'];
    userData['all'] = sum - all!;
    return userData;
  }

  ///必要単位数のマップデータを返す
  getCreditsNumberData(course) {
    Map<String, int> creditsNumberData = _getMap(course);
    return creditsNumberData;
  }

  ///科類別必要単位数のマップデータを取得
  _getMap(String course) {
    Map<String, int> userData = getUserData();
    Sciences sciences = Sciences(course);
    Arts arts = Arts(course, userData);
    if (course == '理科一類' || course == '理科二類' || course == '理科三類') {
      return sciences.getMap(course);
    } else if (course == '文科一類' || course == '文科二類' || course == '文科三類') {
      return arts.getMap(course);
    } else {
      throw Exception('course is ' + course);
    }
  }
}
