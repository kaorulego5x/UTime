class Arts {
  //科類
  final String course;
  final Map userData;
  Arts(this.course, this.userData);

  //科類別必要単位数のリスト
  //文系：[基礎,L系列,社会科学,人文科学,A~C系列,D~F系列,主題科目,その他]
  final Map<String, int> arts1 = {
    'kiso': 29,
    'seriesL': 9,
    'seriesA-C': 6,
    'seriesD-F': 6,
    'shudai': 2,
    'tenkai': 4,
    'all': 56
  };
  final Map<String, int> arts2 = {
    'kiso': 29,
    'seriesL': 9,
    'seriesA-C': 6,
    'seriesD-F': 6,
    'shudai': 2,
    'tenkai': 4,
    'all': 56
  };
  final Map<String, int> arts3 = {
    'kiso': 25,
    'seriesL': 9,
    'seriesA-C': 8,
    'seriesD-F': 8,
    'shudai': 2,
    'tenkai': 4,
    'all': 56
  };

  //科類別必要単位数のリストを返す
  getMap(String course) {
    if (course == '文科一類') {
      return arts1;
    } else if (course == '文科二類') {
      return arts2;
    } else if (course == '文科三類') {
      return arts3;
    } else {
      throw Exception('course is ' + course);
    }
  }
}
