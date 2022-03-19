import 'package:flutter/material.dart';
import 'package:utime/credit_details_dialog.dart';
import 'package:utime/required_credits_dialog.dart';
import 'package:utime/status_dialog.dart';
import 'package:utime/utime_colors.dart';

class CreditsNumber extends StatefulWidget {
  const CreditsNumber({Key? key}) : super(key: key);
  static const String routeName = '/CreditsNumber';

  @override
  State<CreditsNumber> createState() => _CreditsNumberState();
}

class _CreditsNumberState extends State<CreditsNumber> {
  var creditDetailsWidth;

  @override
  Widget build(BuildContext context) {
    // デバイスの縦幅と横幅を取得する
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    //単位数ウィジェットの横幅
    creditDetailsWidth = (screenWidth - 64 - 24) / 2;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '取得単位',
          style: TextStyle(
            fontSize: 18,
            color: UtimeColors.textColor,
          ),
        ),
        backgroundColor: UtimeColors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: UtimeColors.backgroundColor,
          padding: const EdgeInsets.only(right: 32, left: 32),
          child: Center(
            child: Column(
              children: [
                //学年・科類
                _showStatus(),
                //必要単位数
                _showRequiredCredits(),
                //取得単位
                Row(
                  children: [
                    _showCreditDetails('必修科目', UtimeColors.subject1),
                    const SizedBox(width: 24, child: Spacer()),
                    _showCreditDetails('L系列', UtimeColors.subject2),
                  ],
                ),
                Row(
                  children: [
                    _showCreditDetails('A~D系列', UtimeColors.subject3),
                    const SizedBox(width: 24, child: Spacer()),
                    _showCreditDetails('E~F系列', UtimeColors.subject5),
                  ],
                ),
                Row(
                  children: [
                    _showCreditDetails('主題科目', UtimeColors.subject6),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //学年・科類確認ボタンウィジェット
  SizedBox _showStatus() {
    return SizedBox(
      child: Expanded(
        child: (Container(
          width: double.infinity,
          height: 108,
          margin: const EdgeInsets.only(top: 32, bottom: 32),
          child: ElevatedButton(
            child: const Text(
              '理科一類',
              style: TextStyle(
                fontSize: 28,
                color: UtimeColors.textColor,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: UtimeColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              StatusDialog(
                context,
              ).showStatusDialog();
            },
          ),
        )),
      ),
    );
  }

  //必要単位数確認ボタンウィジェット
  SizedBox _showRequiredCredits() {
    return SizedBox(
      child: Expanded(
        child: (Container(
          width: double.infinity,
          height: 52,
          margin: const EdgeInsets.only(bottom: 32),
          child: ElevatedButton(
            child: const Text(
              '必要単位数',
              style: TextStyle(
                fontSize: 16,
                color: UtimeColors.textColor,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: UtimeColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              RequiredCreditsDialog(
                context,
              ).showRequiredCreditsDialog();
            },
          ),
        )),
      ),
    );
  }

  //単位詳細確認ボタンウィジェット
  SizedBox _showCreditDetails(String title, Color color) {
    return SizedBox(
      child: Expanded(
        child: (Container(
          width: creditDetailsWidth,
          height: 112,
          margin: const EdgeInsets.only(bottom: 24),
          child: ElevatedButton(
            child: Column(
              children: [
                //科目区分名
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  width: 80,
                  child: Stack(children: <Widget>[
                    Container(
                      height: 12,
                      margin: const EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: color,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          color: UtimeColors.textColor,
                        ),
                      ),
                    ),
                  ]),
                ),
                //取得単位数/必要単位数
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, left: 40),
                      child: const Text(
                        '2',
                        style: TextStyle(
                          fontSize: 36,
                          color: UtimeColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 36, left: 20),
                      child: const Text(
                        '/ 6',
                        style: TextStyle(
                          fontSize: 16,
                          color: UtimeColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: UtimeColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              CreditDetailsDialog(
                context,
              ).showCreditDetailsDialog();
            },
          ),
        )),
      ),
    );
  }
}
