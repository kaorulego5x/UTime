import 'package:flutter/material.dart';
import 'package:utime/model/status_data.dart';
import 'package:utime/view/pages/credits/credit_details_dialog.dart';
import 'package:utime/view/pages/credits/required_credits_dialog.dart';
import 'package:utime/view/pages/credits/show_credit_details.dart';
import 'package:utime/view/pages/Timetable/status_dialog.dart';
import 'package:utime/const/utime_colors.dart';

class CreditsNumber extends StatefulWidget {
  const CreditsNumber({Key? key}) : super(key: key);
  static const String routeName = '/CreditsNumber';

  @override
  State<CreditsNumber> createState() => _CreditsNumberState();
}

class _CreditsNumberState extends State<CreditsNumber> {
  StatusData statusData = StatusData();

  //サイズ用の変数
  double showStatusWidth = 0;
  double creditDetailsWidth = 0;

  //科類を取得
  String _getCourse() {
    return statusData.getCourse();
  }

  @override
  Widget build(BuildContext context) {
    String course = _getCourse();
    // デバイスの縦幅と横幅を取得する
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    //学年・科類確認ボタンウィジェットの横幅
    showStatusWidth = screenWidth - 64;

    ShowCreditDetails showCreditDetails =
        ShowCreditDetails(course, showStatusWidth, context);

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
          margin: const EdgeInsets.only(bottom: 64),
          padding: const EdgeInsets.only(right: 32, left: 32),
          child: Center(
            child: Column(
              children: [
                //学年・科類
                _showStatus(course),
                //必要単位数
                _showRequiredCredits(),
                //取得単位
                showCreditDetails.showTakenCredits(course),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //学年・科類確認ボタンウィジェット
  SizedBox _showStatus(String course) {
    return SizedBox(
      child: (Container(
        width: showStatusWidth,
        height: 84,
        margin: const EdgeInsets.only(top: 32, bottom: 32),
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'あなたは',
                  style: TextStyle(
                    fontSize: 18,
                    color: UtimeColors.lightTextColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
                child: Spacer(),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  course,
                  style: const TextStyle(
                    fontSize: 24,
                    color: UtimeColors.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
            StatusDialog(
              context,
            ).showStatusDialog();
          },
        ),
      )),
    );
  }

  //必要単位数確認ボタンウィジェット
  SizedBox _showRequiredCredits() {
    return SizedBox(
      child: Expanded(
        child: (Container(
          width: showStatusWidth,
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
}
