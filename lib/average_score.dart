import 'package:flutter/material.dart';
import 'package:utime/average_term.dart';
import 'package:utime/utime_colors.dart';

class AverageScore extends StatefulWidget {
  const AverageScore({Key? key}) : super(key: key);
  static const String routeName = '/AverageScore';

  @override
  State<AverageScore> createState() => _AverageScoreState();
}

class _AverageScoreState extends State<AverageScore> {
  @override
  Widget build(BuildContext context) {
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
          margin: const EdgeInsets.only(bottom: 64),
          color: UtimeColors.backgroundColor,
          // height: screenHeight,
          child: Center(
            child: Column(
              children:[
                //基本平均点
                Container(
                  padding: EdgeInsets.all(32.0),
                  child: SizedBox(
                    height: 188,
                    width: 326,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container( 
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    '基本平均点',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: UtimeColors.textColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 32),
                                  child: Text(
                                    '77.7',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: UtimeColors.textColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container( 
                                  padding: EdgeInsets.only(left: 50),
                                  child: Text(
                                    '重率1:',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: UtimeColors.textColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 50),
                                  child: Text(
                                    '8単位',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: UtimeColors.textColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container( 
                                  padding: EdgeInsets.only(left: 50),
                                  child: Text(
                                    '重率0.1:',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: UtimeColors.textColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 50),
                                  child: Text(
                                    '2単位',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: UtimeColors.textColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AverageTerm("S1ターム", "4単位", "0単位"),
                      AverageTerm("S2ターム", "2単位", "2単位")
                    ]
                  )
                ),
                Container(
                  // padding: EdgeInsets.all(32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AverageTerm("A1ターム", "2単位", "0単位"),
                      AverageTerm("A2ターム", "0単位", "0単位")
                    ]
                  )
                ),
              ]
            )
          )
        )
      ),
    );
  }
}
