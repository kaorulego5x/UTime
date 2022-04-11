import 'package:flutter/material.dart';
import 'package:utime/view/widgets/modal_overlay.dart';
import 'package:utime/const/utime_colors.dart';

class StatusDialog {
  BuildContext context;
  StatusDialog(this.context) : super();

  List<String> courseList = [
    '理科一類',
    '理科二類',
    '理科三類',
    '理科三類',
    '文科一類',
    '文科二類',
    '文科三類'
  ];
  var _groupValue = '理科一類';

  /*
   * 表示
   */
  void showStatusDialog() {
    Navigator.push(
      context,
      ModalOverlay(
        Center(
          child: Container(
            width: 280,
            height: 480,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: UtimeColors.white),
            child: Column(
              children: [
                //ヘッダー
                Container(
                  width: 280,
                  height: 60,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                      color: UtimeColors.backgroundColor),
                  alignment: Alignment.center,
                  child: const Text(
                    '科類選択',
                    style: TextStyle(
                      fontSize: 18,
                      color: UtimeColors.textColor,
                    ),
                  ),
                ),
                //科類選択ラジオボタン
                StatefulBuilder(builder: (context, setState) {
                  return Container(
                      width: 280,
                      padding: const EdgeInsets.only(left: 48),
                      alignment: Alignment.center,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: courseList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return RadioListTile<String>(
                              value: courseList[index],
                              groupValue: _groupValue,
                              activeColor: UtimeColors.radioAccent,
                              title: Text(
                                courseList[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: UtimeColors.textColor,
                                ),
                              ),
                              onChanged: (value) => _onRadioSelected(value),
                            );
                          }));
                })
              ],
            ),
          ),
        ),

        //backボタンを有効にするかどうか
        isAndroidBackEnable: true,
      ),
    );
  }

  _onRadioSelected(value) {
    setState(() {
      _groupValue = value;
    });
  }

  /*
   * 非表示
   */
  void hideCustomDialog() {
    Navigator.of(context).pop();
  }

  void setState(Null Function() param0) {}
}
