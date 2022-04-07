import 'package:flutter/material.dart';
import 'package:utime/dropdown_builder.dart';
import 'package:utime/lecture_data.dart';
import 'package:utime/lecture_dialog_list.dart';
import 'package:utime/modal_overlay.dart';
import 'package:utime/utime_colors.dart';
import 'package:utime/utime_text_styles.dart';

/**
 * Timetablesで授業のコマ押したときに出てくるダイアログ
 */
class LectureDialog {
  BuildContext context;
  LectureDialog(this.context) : super();

  LectureDialogList lectureDialogList = LectureDialogList();
  LectureData lectureData = LectureData();
  UtimeColors utimeColors = UtimeColors();

  //105分授業かどうか
  var isSelected = <bool>[true, false];

  //ドロップダウンボタンで使うやつ
  //String? _SelectedKey = null;
  bool isStretchedDropDown = false;
  //List<bool> _isOpen = [true];
  GlobalKey _widgetKey1 = GlobalKey();
  GlobalKey _widgetKey2 = GlobalKey();
  GlobalKey _widgetKey3 = GlobalKey();

  ///表示する授業データを取得
  getLectureData(String day, String period) {
    Map lectureMapData = lectureData.getLectureData(day, period);
    return lectureMapData;
  }

  ///取っている（データがある）授業を表示
  void showTakenLectureDialog(String day, String period) {
    Map dataToShow = lectureData.getLectureData(day, period);
    _showLectureDialog(day, period, dataToShow);
  }

  ///空のデフォルトLectureDialogを表示
  void showDefaultLectureDialog(String day, String period) {
    Map dataToShow = lectureData.getDefaultLectureData(day, period);
    _showLectureDialog(day, period, dataToShow);
  }

  /*
   * 表示
   */
  void _showLectureDialog(String day, String period, Map dataToShow) {
    Navigator.push(
        context,
        ModalOverlay(
          Center(
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
                    decoration: BoxDecoration(
                      color: dataToShow['dialogColor'],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        //曜限
                        Container(
                          margin: const EdgeInsets.only(top: 24, bottom: 16),
                          child: Text(day + ' ' + period,
                              textAlign: TextAlign.center,
                              style: UtimeTextStyles.lectureDialogDayPeriod),
                        ),
                        //科目区分ドロップダウンボタン
                        Container(
                            key: _widgetKey1,
                            margin: const EdgeInsets.only(bottom: 8),
                            height: 48,
                            child: _showLargeDropdown(
                                '科目区分',
                                lectureDialogList.getSubjectTypeList(),
                                dataToShow['dialogColor'])),
                        //授業情報
                        _titleSet('開講科目名', dataToShow['lectureName']),
                        _titleSet('教員名', dataToShow['teacherName']),
                        _titleSet('教室', dataToShow['classroom']),
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
                              Container(
                                key: _widgetKey2,
                                child: _showSmallDropdown(
                                    '開講区分',
                                    lectureDialogList.getOpenTermList(),
                                    dataToShow['dialogColor']),
                              ),
                              const SizedBox(width: 24, child: Spacer()),
                              Container(
                                key: _widgetKey3,
                                child: _showSmallDropdown(
                                    '単位数',
                                    lectureDialogList.getCreditsNumberList(),
                                    dataToShow['dialogColor']),
                              ),
                            ],
                          ),
                        ),
                        //メモ
                        _memo(dataToShow['dialogColor']),
                        //授業時間ボタン
                        Container(
                          width: 232,
                          margin: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              //授業時間ボタン
                              _classTimeToggle(dataToShow['classTime'],
                                  dataToShow['dialogColor']),
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
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //backボタンを有効にするかどうか
          isAndroidBackEnable: true,
        ));
  }

  /*
   * 非表示
   */
  void hideCustomDialog() {
    Navigator.of(context).pop();
  }

  //タイトルのセット
  Container _titleSet(String t1, String t2) {
    return (Container(
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
          Container(
            alignment: Alignment.center,
            height: 32,
            width: 160,
            child: TextFormField(
              initialValue: t2,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: UtimeTextStyles.lectureDialogTitle,
              decoration: const InputDecoration(
                  border: InputBorder.none, isDense: true, isCollapsed: true),
            ),
          ),
        ],
      ),
    ));
  }

  //セクション名
  Text _section(String section) {
    return (Text(
      section,
      textAlign: TextAlign.center,
      style: UtimeTextStyles.lectureDialogSectionName,
    ));
  }

  //科目区分のドロップダウンボタン
  Column _showLargeDropdown(
      String title, List<ItemModel> itemList, Color dialogColor) {
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

        /*
        Container(
          height: 32,
          width: 216,
          decoration: BoxDecoration(
            color: UtimeColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ButtonTheme(
            alignedDropdown: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: DropdownButton<dynamic>(
                isExpanded: true,
                underline: const SizedBox(),
                hint: Center(
                  child: Text('選択して下さい',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: dialogColor,
                      )),
                ),
                dropdownColor: utimeColors.getDropDownColor(dialogColor),
                elevation: 0,
                iconSize: 0,
                style: const TextStyle(color: UtimeColors.white, fontSize: 12),
                icon: null,
                items: itemList.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: UtimeColors.white,
                        )),
                  );
                }).toList(),
                value: _SelectedKey,
                onChanged: (value) {
                  setState(() {
                    _SelectedKey = value ?? '';
                  });
                },
              ),
            ),
          ),
        ),*/
      ],
    );
  }

  //開講区分と単位数のドロップダウンボタン
  Column _showSmallDropdown(
      String title, List<ItemModel> itemList, Color dialogColor) {
    return Column(
      children: [
        //セクション名
        Container(
            height: 12,
            margin: const EdgeInsets.only(bottom: 4),
            child: _section(title)),
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

  //widgetの位置を取得
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

  //メモウィジェット
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
            )),
      ],
    );
  }

  //授業時間のトグルボタン
  SizedBox _classTimeToggle(int classTime, Color dialogColor) {
    return SizedBox(
      height: 32,
      width: 108,
      child: ToggleButtons(
        children: const [
          Text('90分'),
          Text('105分'),
        ],
        borderWidth: 1,
        borderColor: dialogColor, //枠の色
        borderRadius: BorderRadius.circular(8),
        selectedColor: UtimeColors.white, //選択されている方の文字色
        fillColor: dialogColor, //選択されている方の背景色
        selectedBorderColor: dialogColor, //選択されている方の枠の色
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              if (i == index) {
                isSelected[i] = true;
              } else {
                isSelected[i] = false;
              }
            }
          });
        },
        isSelected: _classTimeSetting(classTime),
      ),
    );
  }

  List<bool> _classTimeSetting(int classTime) {
    if (classTime == 90) {
      return isSelected = <bool>[true, false];
    } else {
      return isSelected = <bool>[false, true];
    }
  }

  void setState(Null Function() param0) {}
}
