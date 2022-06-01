import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//<<<<<<< HEAD:lib/view/pages/Timetable/lecture_dialog.dart
import 'package:utime/const/term.dart';
import 'package:utime/ViewModel/lectureDialogDataProvider.dart';
import 'package:utime/model/lecture_dialog_list.dart';
import 'package:utime/const/utime_colors.dart';
import 'package:utime/const/utime_text_styles.dart';

import '../../widgets/dropdown_builder.dart';

/// TimetablesDisplayで授業のコマ押したときに出てくるダイアログ

enum DropDownType { openTerm, credits }

extension DropDownTypeExtension on DropDownType {
  String get label {
    switch (this) {
      case DropDownType.openTerm:
        return '開講区分';
      case DropDownType.credits:
        return '単位数';
    }
  }
}

class LectureDialog extends StatelessWidget {
  LectureDialog({Key? key, required this.day, required this.period})
      : super(key: key);

  final String day;
  final String period;
  final LectureDialogList lectureDialogList = LectureDialogList();
  final UtimeColors utimeColors = UtimeColors();

  //List<bool> _isOpen = [true];
  final GlobalKey _widgetKey1 = GlobalKey();
  final GlobalKey _widgetKey2 = GlobalKey();
  final GlobalKey _widgetKey3 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 280,
        height: 574,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            //色がついている部分
            Container(
              height: 256,
              width: 280,
              decoration: const BoxDecoration(
                // TODO:Implement Color Setting
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  //曜限
                  Container(
                    margin: const EdgeInsets.only(top: 24, bottom: 12),
                    child: Text(
                      day + ' ' + period,
                      textAlign: TextAlign.center,
                      style: UtimeTextStyles.lectureDialogDayPeriod,
                    ),
                  ),
                  //科目区分ドロップダウンボタン
                  //TODO:開講区分ドロップダウンの実装
                  Container(
                    key: _widgetKey1,
                    margin: const EdgeInsets.only(bottom: 8),
                    height: 48,
                    child: _showLargeDropdown(
                      context,
                      title: '科目区分',
                      itemList: lectureDialogList.getSubjectTypeList(),
                      // TODO implement Colors
                      dialogColor: Colors.amber,
                      // TODO:implement below
                      // selectedValue: selectedSubjectType,
                    ),
                  ),

                  //授業情報
                  const LectureDialogTitle('開講科目名'),
                  const LectureDialogTitle('教員名'),
                  const LectureDialogTitle('教室'),
                ],
              ),
            ),
            //白い部分
            Container(
              height: 318,
              width: 280,
              padding: const EdgeInsets.only(right: 20, left: 20),
              decoration: const BoxDecoration(
                color: UtimeColors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  //ドロップダウンボタン
                  Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 12),
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //開講区分
                        Container(
                          key: _widgetKey2,
                          child: _smallDropdown(
                            context,
                            dropDownType: DropDownType.openTerm,
                            title: '開講区分',
                            itemList: lectureDialogList.getOpenTermList(),
                            // TODO:implement Color
                            dialogColor: Colors.cyan,
                            // TODO:implement selectedValue (?)
                            // selectedValue : ,
                          ),
                        ),
                        const SizedBox(width: 24, child: Spacer()),
                        //単位数
                        Container(
                          key: _widgetKey3,
                          child: _smallDropdown(
                            context,
                            dropDownType: DropDownType.credits,
                            title: '単位数',
                            itemList: lectureDialogList.getCreditsNumberList(),
                            // TODO:implement color
                            dialogColor: Colors.cyan,
                            // TODO:implement selectedCredits (?)
                            // selectedValue: selectedCredits,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //メモ
                  // TODO:implement Colors
                  _memo(Colors.cyan),
                  // _memo(_dataToShow['dialogColor']),
                  //授業時間ボタン
                  // TODO:implement This
                  /*
                  Container(
                    width: 232,
                    margin: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //授業時間ボタン
                        _classTimeToggle(_dataToShow['classTime'],
                            _dataToShow['dialogColor']),
                        //点数入力欄
                        /* Container(
                                  width: 28,
                                  margin: const EdgeInsets.only(left: 12),
                                  child: _section('点数')),
                              Container(
                                width: 80,
                                height: 32,
                                margin: const EdgeInsets.only(left: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(color: dialogColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  style: const TextStyle(
                                    color: UtimeColors.textColor,
                                    fontSize: 8,
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: "",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            */
                        //クリアボタン
                        IconButton(
                          iconSize: 24,
                          color: UtimeColors.deleteIcon,
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // TODO:全データを消去する処理の実装
                          },
                        )
                      ],
                    ),
                  ),
                  */
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  //セクション名
  Text _section(String section) {
    return (Text(
      section,
      textAlign: TextAlign.center,
      style: UtimeTextStyles.lectureDialogSectionName,
    ));
  }

  /// 科目区分のドロップダウンボタン
  Column _showLargeDropdown(
    BuildContext context, {
    required String title,
    required List<ItemModel> itemList,
    required Color dialogColor,
    String? selectedValue,
  }) {
    return Column(
      children: [
        //セクション名
        Container(
            height: 12,
            margin: const EdgeInsets.only(bottom: 4),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: UtimeColors.white.withOpacity(0.75),
              ),
            )),
        //ドロップダウンボタン
        GestureDetector(
          onTap: () {
            RenderBox box = _getWidgetPosition(title);
            DropdownBuilder(
              context,
            ).showSubjectTypeDropdownList(216, dialogColor, box);
          },
          child: Container(
            height: 32,
            width: 216,
            decoration: BoxDecoration(
              color: UtimeColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text('選択して下さい',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: dialogColor,
                  )),
            ),
          ),
        )
      ],
    );
  }

  /// 開講区分と単位数のドロップダウンボタン
  Column _smallDropdown(
    BuildContext context, {
    required DropDownType dropDownType,
    required String title,
    required List<ItemModel> itemList,
    required Color dialogColor,
    String? selectedValue,
  }) {
    return Column(
      children: [
        //セクション名
        Container(
            height: 12,
            margin: const EdgeInsets.only(bottom: 4),
            child: _section(dropDownType.label)),
        //ドロップダウンボタン
        GestureDetector(
          onTap: () {
            if (title == '開講区分') {
              RenderBox box = _getWidgetPosition(title);
              DropdownBuilder(
                context,
              ).showOpenTermDropdownList(108, dialogColor, box);
            } else if (title == '単位数') {
              RenderBox box = _getWidgetPosition(title);
              DropdownBuilder(
                context,
              ).showCreditsNumberDropdownList(108, dialogColor, box);
            }
          },
          child: Container(
            height: 32,
            width: 108,
            decoration: BoxDecoration(
              color: dialogColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text('選択して下さい',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: UtimeColors.white,
                  )),
            ),
          ),
        )
      ],
    );
  }

  /// widgetの位置を取得
  _getWidgetPosition(String title) {
    final RenderBox renderBox1 =
        _widgetKey1.currentContext?.findRenderObject() as RenderBox;
    final RenderBox renderBox2 =
        _widgetKey2.currentContext?.findRenderObject() as RenderBox;
    final RenderBox renderBox3 =
        _widgetKey3.currentContext?.findRenderObject() as RenderBox;

    final Offset offset1 = renderBox1.localToGlobal(Offset.zero);
    final Offset offset2 = renderBox2.localToGlobal(Offset.zero);
    final Offset offset3 = renderBox3.localToGlobal(Offset.zero);
    //print('Offset: ${offset.dx}, ${offset.dy}');
    //print('Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
    if (title == '科目区分') {
      return renderBox1;
    } else if (title == '開講区分') {
      return renderBox2;
    } else if (title == '単位数') {
      return renderBox3;
    } else {
      throw Exception('title is ' + title);
    }
  }

  /// メモウィジェット
  Column _memo(Color dialogColor) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 4, bottom: 4),
            child: _section('メモ')),
        Container(
          height: 144,
          width: 232,
          padding: const EdgeInsets.only(right: 12, left: 12),
          decoration: BoxDecoration(
            border: Border.all(color: dialogColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: TextStyle(
              color: UtimeColors.textColor,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: "メモを入力",
              hintStyle: TextStyle(fontSize: 12),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  //授業時間のトグルボタン
  //TODO:implement This!
  /*
  SizedBox _classTimeToggle(int classTime, Color dialogColor) {
    return SizedBox(
      height: 32,
      width: 108,
      child: ToggleButtons(
        children: const [
          Text('105分'),
          Text('90分'),
        ],
        textStyle: const TextStyle(fontSize: 12, color: UtimeColors.textColor),
        borderWidth: 1,
        borderColor: dialogColor,
        //枠の色
        borderRadius: BorderRadius.circular(8),
        selectedColor: UtimeColors.white,
        //選択されている方の文字色

        fillColor: dialogColor,
        //選択されている方の背景色
        selectedBorderColor: dialogColor,
        //選択されている方の枠の色
        onPressed: (int index) {
          setState(() {
            isPeriodLong = index == 0;
          });
        },
        isSelected: _getClassPeriodFlag(isPeriodLong),
      ),
    );
  }
  */

  List<bool> _getClassPeriodFlag(bool isPeriodLong) {
    if (isPeriodLong) return <bool>[true, false];
    return <bool>[false, true];
  }
}

/// lectureDialog　の　Title のセット
/// 開講区分、教員名、教室
// TODO: ConsumerWidget内にt1までも含まれている
class LectureDialogTitle extends StatelessWidget {
  const LectureDialogTitle(this.t1, {Key? key}) : super(key: key);
  final String t1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 32,
            width: 80,
            child: Text(
              t1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: UtimeColors.white.withOpacity(0.75),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref,Widget? child) {
              final String value = ref.watch(lectureDialogTitleDataProvider);
              return Container(
                alignment: Alignment.center,
                height: 32,
                width: 160,
                child: TextFormField(
                  initialValue: value,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: UtimeTextStyles.lectureDialogTitle,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    isCollapsed: true,
                  ),
                  onChanged: (String? value){
                    
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
