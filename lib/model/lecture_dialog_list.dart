/**
 * DropdownBuilderで使われてるドロップダウンボタンのリストまとめ
 */
class LectureDialogList {
  //開講区分
  final List<ItemModel> _openTermList = [
    ItemModel(text: 'S1', index: 1, selected: true),
    ItemModel(text: 'S2', index: 2, selected: false),
    ItemModel(text: 'S', index: 3, selected: false),
    ItemModel(text: 'A1', index: 4, selected: false),
    ItemModel(text: 'A2', index: 5, selected: false),
    ItemModel(text: 'A', index: 6, selected: false),
  ];
  //単位数
  final List<ItemModel> _creditsNumberList = [
    ItemModel(text: '1.0', index: 1, selected: true),
    ItemModel(text: '2.0', index: 2, selected: false),
  ];
  //科目区分
  final List<ItemModel> _subjectTypeList = [
    ItemModel(text: '基礎科目', index: 1, selected: true),
    ItemModel(text: '総合科目L系列', index: 2, selected: false),
    ItemModel(text: '総合科目A系列', index: 3, selected: false),
    ItemModel(text: '総合科目B系列', index: 4, selected: false),
    ItemModel(text: '総合科目C系列', index: 5, selected: false),
    ItemModel(text: '総合科目D系列', index: 6, selected: false),
    ItemModel(text: '総合科目E系列', index: 7, selected: false),
    ItemModel(text: '総合科目F系列', index: 8, selected: false),
    ItemModel(text: '主題科目', index: 9, selected: false),
    ItemModel(text: '展開科目', index: 10, selected: false),
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
