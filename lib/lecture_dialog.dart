import 'package:flutter/material.dart';
import 'package:utime/modal_overlay.dart';
import 'package:utime/utime_colors.dart';

class LectureDialog {
  BuildContext context;
  LectureDialog(this.context) : super();

  //ドロップダウンボタンで使うやつ
  String? _SelectedKey = null;

  //90分授業かどうか
  final isSelected = <bool>[true, false];

  /*
   * 表示
   */
  void showLectureDialog() {
    Navigator.push(
        context,
        ModalOverlay(
          Center(
            child: Container(
              width: 280,
              height: 574,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: const Radius.circular(12),
                  topLeft: const Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 204,
                    width: 280,
                    decoration: BoxDecoration(
                      color: UtimeColors.subject7,
                      borderRadius: const BorderRadius.only(
                        topRight: const Radius.circular(12),
                        topLeft: const Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 28, bottom: 8),
                          child: Text(
                            'Fri 1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
                    decoration: BoxDecoration(
                      color: UtimeColors.white,
                      borderRadius: const BorderRadius.only(
                        bottomRight: const Radius.circular(12),
                        bottomLeft: const Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 16, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 12,
                                      width: 112,
                                      margin: EdgeInsets.only(bottom: 4),
                                      child: _section('開講区分')),
                                  Container(
                                    height: 32,
                                    width: 112,
                                    decoration: BoxDecoration(
                                      color: UtimeColors.subject7,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: DropdownButton<dynamic>(
                                      hint: Text('選択して下さい',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: UtimeColors.white,
                                          )),
                                      items: [
                                        _dropdownMenuItem('S1'),
                                        _dropdownMenuItem('S2'),
                                        _dropdownMenuItem('S'),
                                        _dropdownMenuItem('A1'),
                                        _dropdownMenuItem('A2'),
                                        _dropdownMenuItem('A'),
                                      ],
                                      value: _SelectedKey,
                                      onChanged: (value) {
                                        setState(() {
                                          _SelectedKey = value ?? 'A';
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 16, child: Spacer()),
                              Column(
                                children: [
                                  Container(
                                      height: 12,
                                      width: 112,
                                      margin: EdgeInsets.only(bottom: 4),
                                      child: _section('単位数')),
                                  Container(
                                    height: 32,
                                    width: 112,
                                    decoration: BoxDecoration(
                                      color: UtimeColors.subject7,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: DropdownButton<dynamic>(
                                      hint: Text('選択して下さい',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: UtimeColors.white,
                                          )),
                                      items: [
                                        _dropdownMenuItem('2.0'),
                                        _dropdownMenuItem('1.0'),
                                        _dropdownMenuItem('0.5'),
                                      ],
                                      value: _SelectedKey,
                                      onChanged: (value) {
                                        setState(() {
                                          _SelectedKey = value ?? '2.0';
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        _section('科目区分'),
                        Container(
                          height: 32,
                          width: 112,
                          decoration: BoxDecoration(
                            color: UtimeColors.subject7,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButton<dynamic>(
                            hint: Text('選択して下さい',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: UtimeColors.white,
                                )),
                            items: [
                              _dropdownMenuItem('必修科目'),
                              _dropdownMenuItem('A'),
                              _dropdownMenuItem('B'),
                              _dropdownMenuItem('C'),
                              _dropdownMenuItem('D'),
                              _dropdownMenuItem('E'),
                              _dropdownMenuItem('F'),
                              _dropdownMenuItem('主題科目'),
                              _dropdownMenuItem('その他'),
                            ],
                            value: _SelectedKey,
                            onChanged: (value) {
                              setState(() {
                                _SelectedKey = value ?? '必修科目';
                              });
                            },
                          ),
                        ),
                        //メモ
                        Container(
                            margin: EdgeInsets.only(top: 20, bottom: 4),
                            child: _section('メモ')),
                        Container(
                            height: 136,
                            width: 240,
                            decoration: BoxDecoration(
                              border: Border.all(color: UtimeColors.subject7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: "　メモ",
                                border: InputBorder.none,
                              ),
                            )),
                        //授業時間ボタン
                        Container(
                          height: 32,
                          margin: EdgeInsets.only(top: 20),
                          child: ToggleButtons(
                            isSelected: isSelected,
                            onPressed: (index) {},
                            children: [
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
      margin: EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
          Container(
            height: 32,
            width: 120,
            child: Text(
              t2,
              textAlign: TextAlign.center,
              style: TextStyle(
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
      style: TextStyle(
        fontSize: 10,
        color: UtimeColors.textColor,
      ),
    ));
  }

  //ドロップダウンボタンの選択肢
  DropdownMenuItem _dropdownMenuItem(String item) {
    return (DropdownMenuItem(
      child: Text(
        item,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          //fontWeight: FontWeight.bold,
          color: UtimeColors.textColor,
        ),
      ),
      value: item,
    ));
  }

  void setState(Null Function() param0) {}
}
