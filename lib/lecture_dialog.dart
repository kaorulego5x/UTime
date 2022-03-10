import 'package:flutter/material.dart';
import 'package:utime/modal_overlay.dart';

class LectureDialog extends StatefulWidget {
  @override
  _LectureDialogState createState() => _LectureDialogState();
}

class _LectureDialogState extends State<LectureDialog>{
  Map<String, List<String>> _dropDownMenu = {
    'Study': ['Math', 'Englsih', 'Japanese'],
    'Workout': ['Shoulder', 'Chest', 'Back'],
    'Coding': ['Flutter', 'Python', 'C#']
  };

  String _selectedKey = '';

  //表示
  /*
  void showLectureDialog() {
    Navigator.push(
      context,
      ModalOverlay(
        Center(
          child: Container(
            width: 280,
            height: 574,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xfff3f3f3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Container(child: Column(
                  children: [
                    Text('Fri 1'),
                    Row(
                      children: [
                        Text('開講科目名'),
                        Text('科目'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('教員名'),
                        Text('教員'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('教室'),
                        Text('教室'),
                      ],
                    ),
                  ],
                ),
                ),
                Row(children: [
                  Column(children: [
                    Text('開講区分'),
                    //DropdownButton(items: items, onChanged: onChanged)
                    DropdownButton(
          items: _items,
          value: _selectItem,
          onChanged: (value) => {
            setState(() {
              _selectItem = value;
            }),
          },
        ),
                  ],)
                ],),
              ],
            ),
          ),
        ),
        isAndroidBackEnable: false,
      ),
    );
  }

   */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 280,
          height: 574,
          color: Colors.black.withOpacity(0.3),
          child: Column(
            children: [
              Container(
                height: 204,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: const BorderRadius.only(
                    topRight: const Radius.circular(12),
                    topLeft: const Radius.circular(12),
                  ),
                ),
                child: Column(
                children: [
                  Text('Fri 1'),
                  Row(
                    children: [
                      Text('開講科目名'),
                      Text('科目'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('教員名'),
                      Text('教員'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('教室'),
                      Text('教室'),
                    ],
                  ),
                ],
              ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: const BorderRadius.only(
                    bottomRight: const Radius.circular(12),
                    bottomLeft: const Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    Row(children: [
                      Column(children: [
                        Text('開講区分'),
                        /*
                        DropdownButton<String>(
                          value: _selectedKey,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          items: _dropDownMenu.keys
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedKey = value!;
                            });
                          },
                        )

                         */
                      ],),
                      Column(children: [
                        Text('単位数'),
                        //ボタン
                    ],),
                    ],),
                    Text('科目区分'),
                    //ボタン
                    Text('メモ'),
                    //メモ
                    Row(children: [
                      //105分
                      //90分
                    ],),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
