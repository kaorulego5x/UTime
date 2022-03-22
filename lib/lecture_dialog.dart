import 'package:flutter/material.dart';
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

  //90分授業かどうか
  final isSelected = <bool>[true, false];

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
                    height: 204,
                    width: 280,
                    decoration: const BoxDecoration(
                      color: UtimeColors.subject7,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 28, bottom: 8),
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
                        _titleSet('開講科目名', '科目'),
                        _titleSet('教員名', '教員'),
                        _titleSet('教室', '教室'),
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
                              _showDropdown('開講区分', openTermList, 112),
                              const SizedBox(width: 16, child: Spacer()),
                              _showDropdown('単位数', creditsNumberList, 112),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 48,
                            child: _showDropdown('科目区分', subjectTypeList, 240)),
                        //メモ
                        _memo(),
                        //授業時間ボタン
                        Container(
                          height: 32,
                          margin: const EdgeInsets.only(top: 20),
                          child: ToggleButtons(
                            isSelected: isSelected,
                            onPressed: (index) {},
                            children: const [
                              Text('105分'),
                              Text('90分'),
                            ],
                            borderWidth: 2,
                            borderColor: UtimeColors.subject7,
                            borderRadius: BorderRadius.circular(12.0),
                            selectedColor: UtimeColors.white,
                            fillColor: UtimeColors.subject7,
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
            color: UtimeColors.subject7,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<dynamic>(
            hint: const Text('選択して下さい',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: UtimeColors.white,
                )),
            dropdownColor: UtimeColors.subject7,
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
            margin: const EdgeInsets.only(top: 20, bottom: 4),
            child: _section('メモ')),
        Container(
            height: 136,
            width: 240,
            padding: const EdgeInsets.only(right: 12, left: 12),
            decoration: BoxDecoration(
              border: Border.all(color: UtimeColors.subject7),
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
                border: InputBorder.none,
              ),
            )),
      ],
    );
  }

  void setState(Null Function() param0) {}
}
