import 'package:flutter/material.dart';
import 'package:utime/view/pages/average/average_term.dart';
import 'package:utime/const/utime_colors.dart';

class AverageScore extends StatefulWidget {
  const AverageScore({Key? key}) : super(key: key);
  static const String routeName = '/AverageScore';

  @override
  State<AverageScore> createState() => _AverageScoreState();
}

class _AverageScoreState extends State<AverageScore> {
  var showAverageWidth;

  @override
  Widget build(BuildContext context) {
    // デバイスの縦幅と横幅を取得する
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    //学年・科類確認ボタンウィジェットの横幅
    showAverageWidth = screenWidth - 64;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '平均点',
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
              padding: const EdgeInsets.only(bottom: 84),
              color: UtimeColors.backgroundColor,
              child: Center(
                  child: Column(children: [
                //基本平均点
                _showAverage(77.7, 8, 2),
                //タームごとの取得単位数
                Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AverageTerm("1年 S1ターム", "4単位", "0単位"),
                          const SizedBox(
                            width: 30,
                            child: Spacer(),
                          ),
                          AverageTerm("1年 S2ターム", "2単位", "2単位")
                        ])),
                Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AverageTerm("1年 A1ターム", "2単位", "0単位"),
                          const SizedBox(
                            width: 30,
                            child: Spacer(),
                          ),
                          AverageTerm("1年 A2ターム", "0単位", "0単位")
                        ])),
                Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AverageTerm("2年 S1ターム", "2単位", "0単位"),
                          const SizedBox(
                            width: 30,
                            child: Spacer(),
                          ),
                          AverageTerm("2年 S2ターム", "0単位", "0単位")
                        ])),
              ])))),
    );
  }

  //平均点確認ボタンウィジェット
  SizedBox _showAverage(
      double average, double weightOne, double weightZeroPointOne) {
    return SizedBox(
      child: (Container(
        width: showAverageWidth,
        height: 188,
        margin: const EdgeInsets.only(top: 32, bottom: 22, right: 32, left: 32),
        child: ElevatedButton(
          child: Column(
            children: [
              //基本平均点
              Container(
                margin: const EdgeInsets.only(top: 32, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      alignment: Alignment.center,
                      child: const Text(
                        '基本平均点',
                        style: TextStyle(
                          fontSize: 16,
                          color: UtimeColors.lightTextColor,
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        '$average',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 36,
                          color: UtimeColors.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //重率１
              _unitsNumberSet('重率   1   :', weightOne),
              //重率0.1
              _unitsNumberSet('重率  0.1 :', weightZeroPointOne),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: UtimeColors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
        ),
      )),
    );
  }

  Container _unitsNumberSet(String title, double number) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 24,
            width: 108,
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: UtimeColors.lightTextColor,
              ),
            ),
          ),
          Container(
            height: 24,
            width: 108,
            alignment: Alignment.center,
            child: Text(
              '$number',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: UtimeColors.textColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
