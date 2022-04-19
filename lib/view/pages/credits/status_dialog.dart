import 'package:flutter/material.dart';
import 'package:utime/const/utime_text_styles.dart';
import 'package:utime/model/settings.dart';
import 'package:utime/view/widgets/modal_overlay.dart';
import 'package:utime/const/utime_colors.dart';

enum RadioValue { s1, s2, s3, l1, l2, l3 }

class StatusDialog extends StatefulWidget {
  StatusDialog(BuildContext context);

  @override
  State<StatusDialog> createState() => _StatusDialogState();
}

class _StatusDialogState extends State<StatusDialog> {
  Settings settings = Settings();
/*
  List<String> courseList = [
    '理科一類',
    '理科二類',
    '理科三類',
    '理科三類',
    '文科一類',
    '文科二類',
    '文科三類'
  ];*/
  List<Enum> courseList = [
    RadioValue.s1,
    RadioValue.s2,
    RadioValue.s3,
    RadioValue.l1,
    RadioValue.l2,
    RadioValue.l3
  ];
  var _groupValue = RadioValue.s1;

  //wiget作成時の処理
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //閉じた時の処理

        settings.setCourse(_radioValueToTitle(_groupValue));
        print(settings.getCourse());

        return true;
      },
      child: Center(
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
                    child: Column(children: <Widget>[
                      RadioListTile<RadioValue>(
                          value: RadioValue.s1,
                          groupValue: _groupValue,
                          activeColor: UtimeColors.radioAccent,
                          title: const Text(
                            '理科一類',
                            style: UtimeTextStyles.courseListText,
                          ),
                          onChanged: (RadioValue? value) {
                            setState(() {
                              _groupValue = value!;
                            });
                          }),
                      RadioListTile<RadioValue>(
                          value: RadioValue.s2,
                          groupValue: _groupValue,
                          activeColor: UtimeColors.radioAccent,
                          title: const Text(
                            '理科二類',
                            style: UtimeTextStyles.courseListText,
                          ),
                          onChanged: (RadioValue? value) {
                            setState(() {
                              _groupValue = value!;
                            });
                          }),
                      RadioListTile<RadioValue>(
                          value: RadioValue.s3,
                          groupValue: _groupValue,
                          activeColor: UtimeColors.radioAccent,
                          title: const Text(
                            '理科三類',
                            style: UtimeTextStyles.courseListText,
                          ),
                          onChanged: (RadioValue? value) {
                            setState(() {
                              _groupValue = value!;
                            });
                          }),
                    ]));
              })
            ],
          ),
        ),
      ),
    );
  }

  String _radioValueToTitle(RadioValue radioValue) {
    if (radioValue == RadioValue.s1) {
      return '理科一類';
    } else if (radioValue == RadioValue.s2) {
      return '理科二類';
    } else if (radioValue == RadioValue.s3) {
      return '理科三類';
    } else if (radioValue == RadioValue.l1) {
      return '文科一類';
    } else if (radioValue == RadioValue.l2) {
      return '文科二類';
    } else if (radioValue == RadioValue.l3) {
      return '文科三類';
    } else {
      throw Exception('RadioValue is $radioValue');
    }
  }

  /*
   * 非表示
   */
  void hideCustomDialog() {
    Navigator.of(context).pop<RadioValue>(RadioValue.s1);
  }

  //void setState(Null Function() param0) {}

}
