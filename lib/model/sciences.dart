

class Sciences {
  //科類
  final String course;
  Sciences(this.course);

  //科類別必要単位数のリスト
  //理系：[基礎,L系列,A~D系列,E~F系列,主題科目,その他]
  final Map<String, int> sciences1 = {
    'kiso': 43,
    'seriesL': 3,
    'seriesA-D': 6,
    'seriesE-F': 6,
    'shudai': 2,
    'tenkai': 0,
    'all': 63
  };
  final Map<String, int> sciences2 = {
    'kiso': 44,
    'seriesL': 3,
    'seriesA-C': 6,
    'seriesD-F': 6,
    'shudai': 2,
    'tenkai': 0,
    'all': 63
  };
  final Map<String, int> sciences3 = {
    'kiso': 44,
    'seriesL': 3,
    'seriesA-C': 6,
    'seriesD-F': 6,
    'shudai': 2,
    'tenkai': 0,
    'all': 63
  };

  //科類別必要単位数のリストを返す
  getMap(String course) {
    if (course == '理科一類') {
      return sciences1;
    } else if (course == '理科二類') {
      return sciences2;
    } else if (course == '理科三類') {
      return sciences3;
    } else {
      throw Exception('course is ' + course);
    }
  }
}
