///
/// DropdownBuilderで使われてるドロップダウンボタンのリストまとめ
///
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
    '総合科目L系列',
    '総合科目A系列',
    '総合科目B系列',
    '総合科目C系列',
    '総合科目D系列',
    '総合科目E系列',
    '総合科目F系列',
    '主題科目',
    '展開科目',
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

class ItemModel {
  String text;
  int index;
  bool selected;

  ItemModel({required this.text, required this.index, required this.selected});
}
