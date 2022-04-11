/**
 * LectureDialogで使われてるドロップダウンボタンのリストまとめ
 */
class LectureDialogList {
  //開講区分
  final List<String> _openTermList = [
    'S1',
    'S2',
    'S',
    'A1',
    'A2',
    'A',
  ];
  //単位数
  final List<String> _creditsNumberList = [
    '1.0',
    '2.0',
  ];
  //科目区分
  final List<String> _subjectTypeList = [
    '基礎科目',
    'A系列',
    'B系列',
    'C系列',
    'D系列',
    'E系列',
    'F系列',
    '主題科目',
    '展開科目'
  ];

  getOpenTermList() {
    return _openTermList;
  }

  getCreditsNumberList() {
    return _creditsNumberList;
  }

  getSubjectTypeList() {
    return _subjectTypeList;
  }
}
