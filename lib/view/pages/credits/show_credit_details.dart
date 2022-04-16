import 'package:flutter/material.dart';
import 'package:utime/view/pages/credits/credit_details_dialog.dart';
import 'package:utime/model/credits_number_data.dart';
import 'package:utime/const/utime_colors.dart';

class ShowCreditDetails {
  final String course; //科類
  final double showstatusWidth; //必要単位数確認ボタンウィジェットの横幅
  final BuildContext context;
  ShowCreditDetails(this.course, this.showstatusWidth, this.context);

  //単位詳細確認ボタンウィジェットの横幅
  double creditDetailsWidth = 0;
  getcreditDetailsWidth() {
    return (showstatusWidth - 30) / 2;
  }

  ///取得単位数をCreditsNumberDataクラスから持ってくる
  _getTakenUnits() {
    CreditsNumberData creditsNumberData = CreditsNumberData(course);
    Map<String, int> takenUnits = creditsNumberData.getTakenUnits();
    return takenUnits;
  }

  ///ウィジェットのタイトルによって該当する単位の合計を返す
  _getTakenUnitsSum(String title) {
    //取得単位数のマップデータ
    Map<String, int> takenUnits = _getTakenUnits();
    int? kiso = takenUnits['kiso'];
    int? seriesL = takenUnits['seriesL'];
    int? seriesA = takenUnits['seriesA'];
    int? seriesB = takenUnits['seriesB'];
    int? seriesC = takenUnits['seriesC'];
    int? seriesD = takenUnits['seriesD'];
    int? seriesE = takenUnits['seriesE'];
    int? seriesF = takenUnits['seriesF'];
    int? shudai = takenUnits['shudai'];
    int? tenkai = takenUnits['tenkai'];

    if (title == '基礎科目') {
      return kiso!;
    } else if (title == '総合科目L系列') {
      return seriesL!;
    } else if (title == 'A~総合科目D系列') {
      return seriesA! + seriesB! + seriesC! + seriesD!; //理系用
    } else if (title == 'E~総合科目F系列') {
      return seriesE! + seriesF!; //理系用
    } else if (title == 'A~総合科目C系列') {
      return seriesA! + seriesB! + seriesC!; //文系用
    } else if (title == 'D~総合科目F系列') {
      return seriesD! + seriesE! + seriesF!; //文系用
    } else if (title == '主題科目') {
      return shudai!;
    } else if (title == '展開科目') {
      return tenkai!;
    } else {
      throw Exception('title is incorrect');
    }
  }

  ///必要単位数をCreditsNumberDataクラスから持ってくる
  _getCreditsNumberData() {
    CreditsNumberData creditsNumberData = CreditsNumberData(course);
    Map<String, int> takenUnits =
        creditsNumberData.getCreditsNumberData(course);
    return takenUnits;
  }

  ///必要単位数を返す
  _getCreditsNumberDataSum(String course, String title) {
    //取得単位数のマップデータ
    Map<String, int> takenUnits = _getCreditsNumberData();
    //値格納用変数
    int? kiso;
    int? seriesL;
    int? seriesAtoD; //理系用
    int? seriesEtoF; //理系用
    int? seriesAtoC; //文系用
    int? seriesDtoF; //文系用
    int? shudai;
    int? tenkai;
    int? all;

    if (course == '理科一類' || course == '理科二類' || course == '理科三類') {
      kiso = takenUnits['kiso'];
      seriesL = takenUnits['seriesL'];
      seriesAtoD = takenUnits['seriesA-D'];
      seriesEtoF = takenUnits['seriesE-F'];
      shudai = takenUnits['shudai'];
      tenkai = takenUnits['tenkai'];
      all = takenUnits['all'];
    } else if (course == '文科一類' || course == '文科二類' || course == '文科三類') {
      kiso = takenUnits['kiso'];
      seriesL = takenUnits['seriesL'];
      seriesAtoC = takenUnits['seriesA-C'];
      seriesDtoF = takenUnits['seriesD-F'];
      shudai = takenUnits['shudai'];
      tenkai = takenUnits['tenkai'];
      all = takenUnits['all'];
    } else {
      throw Exception('course is ' + course);
    }

    if (title == '基礎科目') {
      return kiso!;
    } else if (title == '総合科目L系列') {
      return seriesL!;
    } else if (title == '列A~D系') {
      return seriesAtoD; //理系用(文系ならnull)
    } else if (title == 'E~総合科目F系列') {
      return seriesEtoF; //理系用(文系ならnull)
    } else if (title == 'A~総合科目C系列') {
      return seriesAtoC; //文系用(理系ならnull)
    } else if (title == 'D~総合科目F系列') {
      return seriesDtoF; //文系用(理系ならnull)
    } else if (title == '主題科目') {
      return shudai!;
    } else if (title == '展開科目') {
      return tenkai!;
    } else {
      throw Exception('title is incorrect');
    }
  }

  ///単位詳細確認ボタンウィジェット
  SizedBox _showCreditDetails(String title, Color color) {
    return SizedBox(
      child: (Container(
        width: getcreditDetailsWidth(),
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
                    margin: const EdgeInsets.only(top: 20, left: 32),
                    child: Text(
                      _getTakenUnitsSum(title).toString(),
                      style: const TextStyle(
                        fontSize: 36,
                        color: UtimeColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 36, left: 20),
                    child: Text(
                      '/ ' + _getCreditsNumberDataSum(course, title).toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: UtimeColors.lightTextColor,
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
            CreditDetailsDialog(context, title).showCreditDetailsDialog();
          },
        ),
      )),
    );
  }

  //文系の基礎科目詳細確認ウィジェット
  SizedBox _showArtsKisoDetails(String title, Color color) {
    return SizedBox(
      child: (Container(
        width: showstatusWidth,
        height: 112,
        margin: const EdgeInsets.only(bottom: 24),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: ElevatedButton(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: getcreditDetailsWidth(),
                    //基礎科目
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
                              margin: const EdgeInsets.only(top: 20, left: 32),
                              child: Text(
                                _getTakenUnitsSum(title).toString(),
                                style: const TextStyle(
                                  fontSize: 36,
                                  color: UtimeColors.textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 36, left: 20),
                              child: Text(
                                '/ ' +
                                    _getCreditsNumberDataSum(course, title)
                                        .toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: UtimeColors.lightTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                    child: Spacer(),
                  ),
                  SizedBox(
                    width: getcreditDetailsWidth(),
                    child: Column(
                      children: [
                        //人文科学
                        Row(
                          children: [
                            //科目区分名
                            Container(
                              child: Text(
                                '人文科学：',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: UtimeColors.textColor,
                                ),
                              ),
                            ),
                            //取得単位数/必要単位数
                            Container(
                              //margin: const EdgeInsets.only(top: 20, left: 32),
                              child: Text(
                                _getTakenUnitsSum(title).toString(),
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: UtimeColors.textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              //margin: const EdgeInsets.only(top: 36, left: 20),
                              child: Text(
                                '/ ' +
                                    _getCreditsNumberDataSum(course, title)
                                        .toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: UtimeColors.lightTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),

                        //社会科学
                        Row(
                          children: [
                            //科目区分名
                            Container(
                              child: Text(
                                '社会科学：',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: UtimeColors.textColor,
                                ),
                              ),
                            ),
                            //取得単位数/必要単位数
                            Container(
                              //margin: const EdgeInsets.only(top: 20, left: 32),
                              child: Text(
                                _getTakenUnitsSum(title).toString(),
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: UtimeColors.textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              //margin: const EdgeInsets.only(top: 36, left: 20),
                              child: Text(
                                '/ ' +
                                    _getCreditsNumberDataSum(course, title)
                                        .toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: UtimeColors.lightTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: UtimeColors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(0)),
            onPressed: () {
              CreditDetailsDialog(context, title).showCreditDetailsDialog();
            },
          ),
        ),
      )),
    );
  }

  //取得単位のセット
  showTakenCredits(String course) {
    if (course == '理科一類' || course == '理科二類' || course == '理科三類') {
      return Column(children: [
        Row(
          children: [
            _showCreditDetails('基礎科目', UtimeColors.subject1),
            const SizedBox(width: 30, child: Spacer()),
            _showCreditDetails('総合科目L系列', UtimeColors.subject2),
          ],
        ),
        Row(
          children: [
            _showCreditDetails('A~総合科目D系列', UtimeColors.subject3),
            const SizedBox(width: 30, child: Spacer()),
            _showCreditDetails('E~総合科目F系列', UtimeColors.subject5),
          ],
        ),
        Row(
          children: [
            _showCreditDetails('主題科目', UtimeColors.subject6),
            const SizedBox(width: 30, child: Spacer()),
            _showCreditDetails('展開科目', UtimeColors.subject8),
          ],
        ),
      ]);
    } else if (course == '文科一類' || course == '文科二類' || course == '文科三類') {
      return Column(children: [
        Row(
          children: [
            _showArtsKisoDetails('基礎科目', UtimeColors.subject1),
          ],
        ),
        Row(
          children: [
            _showCreditDetails('総合科目L系列', UtimeColors.subject2),
            const SizedBox(width: 30, child: Spacer()),
            _showCreditDetails('A~総合科目C系列', UtimeColors.subject3),
          ],
        ),
        Row(
          children: [
            _showCreditDetails('D~総合科目F系列', UtimeColors.subject5),
            const SizedBox(width: 30, child: Spacer()),
            _showCreditDetails('主題科目', UtimeColors.subject6),
          ],
        ),
        Row(
          children: [
            _showCreditDetails('展開科目', UtimeColors.subject8),
          ],
        ),
      ]);
    } else {
      throw Exception('course is incorrect');
    }
  }
}
