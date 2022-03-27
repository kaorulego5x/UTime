import 'package:flutter/material.dart';
import 'package:utime/utime_colors.dart';
import 'package:utime/average_details_dialog.dart';

class AverageTerm extends StatelessWidget {
  // const AverageTerm({Key? key}) : super(key: key);
  final String term;
  final String one;
  final String zeroPointOne;
  const AverageTerm(this.term, this.one, this.zeroPointOne);

  @override
  Widget build(BuildContext context) {
    // デバイスの縦幅と横幅を取得する
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    //学年・科類確認ボタンウィジェットの横幅
    var termWidth = (screenWidth - 64 - 30) / 2;

    return SizedBox(
        height: 120,
        width: termWidth,
        child: ElevatedButton(
          onPressed: () {
            AverageDetailsDialog(
              context,
            ).showAverageDetailsDialog();
          },
          style: ElevatedButton.styleFrom(
            primary: UtimeColors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //ターム
                Container(
                    height: 28,
                    width: 120,
                    margin: const EdgeInsets.only(top: 16),
                    alignment: Alignment.center,
                    child: Stack(children: <Widget>[
                      Container(
                        height: 12,
                        margin: const EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: UtimeColors.backgroundColor,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          term,
                          style: const TextStyle(
                            fontSize: 18,
                            color: UtimeColors.textColor,
                          ),
                        ),
                      ),
                    ])),
                //重率１
                Container(
                  height: 24,
                  margin: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 24,
                        width: 56,
                        alignment: Alignment.center,
                        child: const Text(
                          '重率  1  :',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: UtimeColors.lightTextColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 28,
                        width: 54,
                        alignment: Alignment.center,
                        child: Text(
                          one + ' 単位',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: UtimeColors.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //重率0.1
                Container(
                  height: 24,
                  margin: const EdgeInsets.only(top: 4, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 24,
                        width: 56,
                        alignment: Alignment.center,
                        child: const Text(
                          '重率 0.1 :',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: UtimeColors.lightTextColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 28,
                        width: 54,
                        alignment: Alignment.center,
                        child: Text(
                          zeroPointOne + ' 単位',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: UtimeColors.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ));
  }
}
