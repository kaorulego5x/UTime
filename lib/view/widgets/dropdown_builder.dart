import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:utime/ViewModel/lectureDialogDataProvider.dart';
import 'package:utime/ViewModel/timetablesDataProvider/timetablesProvider.dart';
import 'package:utime/const/utime_colors.dart';
import 'package:utime/view/widgets/dropdown_modal_overlay.dart';
import 'package:utime/model/lecture_dialog_list.dart';

class DropdownBuilder {
  BuildContext context;

  DropdownBuilder(this.context) : super();

  //ドロップダウンのリスト
  var selectedIndex = 1;
  LectureDialogList lectureDialogList = LectureDialogList();

  //ラジオボタンのモデル
  //List<RadioModel> _radioData = [];
  //ドロップダウンの色
  Color dropdownColor = UtimeColors.darkGray; //初期値

  //var _groupValue = ItemModel(text: '基礎科目', index: 1, selected: true);

  getSubjectTypeList() {
    List<String> _subjectTypeList = lectureDialogList.getSubjectTypeList();
    return _subjectTypeList;
  }

  getOpenTermList() {
    List<String> _openTermList = lectureDialogList.getOpenTermList();
    return _openTermList;
  }

  getCreditsNumberList() {
    List<String> _creditsNumberList = lectureDialogList.getCreditsNumberList();
    return _creditsNumberList;
  }

  getDropdownColor(Color color) {
    UtimeColors utimeColors = UtimeColors();
    dropdownColor = utimeColors.getDropDownColor(color);
    return dropdownColor;
  }

  ///　科目選択ドロップダウンを表示
  void showSubjectTypeDropdownList(double width, Color dialogColor,
      RenderBox box, String day, String period) {
    List<String> listItems = getSubjectTypeList();
    showDropdownList(
        480, width, dialogColor, listItems, box, '科目区分', day, period);
  }

  /// 開講区分のドロップダウンを表示
  void showOpenTermDropdownList(double width, Color dialogColor, RenderBox box,
      String day, String period) {
    List<String> listItems = getOpenTermList();
    showDropdownList(
        224, width, dialogColor, listItems, box, '開講区分', day, period);
  }

  ///単位数ドロップダウンを表示
  void showCreditsNumberDropdownList(double width, Color dialogColor,
      RenderBox box, String day, String period) {
    List<String> listItems = getCreditsNumberList();
    showDropdownList(
        76, width, dialogColor, listItems, box, '単位数', day, period);
  }

  /*
   * 表示
   */
  void showDropdownList(
    double height,
    double width,
    Color dialogColor,
    List<String> listItems,
    RenderBox box,
    String title,
    String day,
    String period,
  ) {
    Color dropdownColor = getDropdownColor(dialogColor);
    final Offset offset = box.localToGlobal(Offset.zero);
    final Size size = box.size;
    Navigator.push(
      context,
      DropdownModalOverlay(Container(
        width: width,
        height: height,
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: dropdownColor),
        child: ListView.builder(
          itemCount: listItems.length,
          itemExtent: 36,
          itemBuilder: (context, index) {
            //背景
            return Consumer(
              builder: (context, ref, child) {
                return GestureDetector(
                    onTap: () {
                      // Provider つかってもう少しきれいにかけそう
                      switch (title) {
                        case ('科目区分'):
                          ref
                              .watch(timeTablesDisplayProvider.notifier)
                              .changeSubjectType(listItems[index], day, period);
                          ref
                              .watch(timeTablesDisplayProvider.notifier)
                              .changeDialogColor(day, period);
                          break;
                        case ('開講区分'):
                          ref
                              .watch(timeTablesDisplayProvider.notifier)
                              .changeOpenTerm(listItems[index], day, period);
                          break;
                        case ('単位数'):
                          ref
                              .watch(timeTablesDisplayProvider.notifier)
                              .changeCreditNumber(
                                  listItems[index], day, period);
                          break;
                      }
                      hideCustomDialog();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 4, bottom: 4, left: 8, right: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        // TODO:implement This!
                        /*
                  color: listItems[index].selected
                      ? dialogColor //選択されていないときの背景色
                      : dropdownColor, //選択されているときの背景色
                   */
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        listItems[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: UtimeColors.white),
                        textAlign: TextAlign.center,
                      ),
                    ));
              },
            );
          },
        ),
      )),
    );
  }

  /// CustomDialogを閉じる
  void hideCustomDialog() {
    Navigator.of(context).pop();
  }

  void setState(Null Function() param0) {}
}
