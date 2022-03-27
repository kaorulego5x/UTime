import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utime/modal_overlay.dart';
import 'package:utime/utime_colors.dart';

class LectureDialog {
  BuildContext context;
  LectureDialog(this.context) : super();

  //ドロップダウンボタンで使うやつ
  String? _SelectedKey = null;
  //開講区分
  List<String> openTermList = [
    'S1',
    'S2',
    'S',
    'A1',
    'A2',
    'A',
  ];
  //開講区分
  List<String> creditsNumberList = [
    '1.0',
    '2.0',
  ];
  //科目区分
  List<String> subjectTypeList = [
    '必修科目',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    '主題科目',
    'その他'
  ];

  //変数
  String lectureName = '科目';
  String openTerm = '';
  String subjectType = '';
  double creditsNumber = 0;
  int score = 0;
  String teacherName = '教員';
  String classroom = '教室';
  String notes = '';
  int classTime = 105;
  Color dialogColor = UtimeColors.subject2;
  Color dropdownColor = UtimeColors.subject3;

  //105分授業かどうか
  var isSelected = <bool>[true, false];

  /*
   * 表示
   */
  void showLectureDialog(String day, String period) {
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
                  Container(
                    height: 192,
                    width: 280,
                    decoration: BoxDecoration(
                      color: dialogColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        //曜限
                        Container(
                          margin: const EdgeInsets.only(top: 24, bottom: 8),
                          child: Text(
                            day + ' ' + period,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: UtimeColors.white,
                            ),
                          ),
                        ),
                        _titleSet('開講科目名', lectureName),
                        _titleSet('教員名', teacherName),
                        _titleSet('教室', classroom),
                      ],
                    ),
                  ),
                  Container(
                    width: 280,
                    height: 370,
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
                        Container(
                          margin: const EdgeInsets.only(top: 16, bottom: 20),
                          height: 48,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _showDropdown('開講区分', openTermList, 108),
                              const SizedBox(width: 16, child: Spacer()),
                              _showDropdown('単位数', creditsNumberList, 108),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 48,
                            child: _showDropdown('科目区分', subjectTypeList, 232)),
                        //メモ
                        _memo(),
                        //授業時間ボタン
                        Container(
                          width: 232,
                          margin: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              _classTimeToggle(),
                              Container(
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
          SizedBox(
            height: 32,
            width: 120,
            child: Text(
              t1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: UtimeColors.white.withOpacity(0.75),
              ),
            ),
          ),
          SizedBox(
            height: 32,
            width: 120,
            child: Text(
              t2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: UtimeColors.white,
              ),
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
      style: const TextStyle(
        fontSize: 10,
        color: UtimeColors.textColor,
      ),
    ));
  }

  //ドロップダウンボタン
  Column _showDropdown(String title, List<String> itemList, double width) {
    return Column(
      children: [
        Container(
            height: 12,
            margin: const EdgeInsets.only(bottom: 4),
            child: _section(title)),
        Container(
          height: 32,
          width: width,
          decoration: BoxDecoration(
            color: dialogColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<dynamic>(
            isExpanded: true,
            underline: const SizedBox(),
            hint: const Center(
              child: Text('選択して下さい',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: UtimeColors.white,
                  )),
            ),
            dropdownColor: dropdownColor,
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
      ],
    );
  }

  //メモウィジェット
  Column _memo() {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 16, bottom: 4),
            child: _section('メモ')),
        Container(
            height: 128,
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
  SizedBox _classTimeToggle() {
    return SizedBox(
      height: 32,
      width: 108,
      child: ToggleButtons(
        children: const [
          Text('105分'),
          Text('90分'),
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
    if (classTime == 105) {
      return isSelected = <bool>[true, false];
    } else {
      return isSelected = <bool>[false, true];
    }
  }

  void setState(Null Function() param0) {}
}
