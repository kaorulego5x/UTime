import 'package:flutter/material.dart';

import 'package:utime/lecture_dialog.dart';


class TimeTables extends StatefulWidget {
  const TimeTables({Key? key}) : super(key: key);
  static const String routeName = '/timeTables';

  @override
  State<TimeTables> createState() => _TimeTablesState();
}

class _TimeTablesState extends State<TimeTables> {

  @override
  Widget build(BuildContext context) {
    // デバイスの縦幅と横幅を取得する
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    //サイズ用の変数
    final double classHeight= 0;  //1コマの高さ
    final double classWidth=(screenWidth-28);  //1コマの横幅

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Color(0xFF2E2E2E),),
        centerTitle: true,
        title: Text('時間割',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF2E2E2E),
          ),
        ),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.0,
      ),

      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFE4F9FB),
          child: Center(
            child: Column(
              children:[
                //ターム
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text('S1ターム',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E2E2E),),
                  ),
                ),
                //曜日
                Container(
                  width: double.infinity,
                  height: 24,
                  margin: const EdgeInsets.only(left: 32.0, right:32.0,bottom:4.0),
                  child: Row(
                    children: [
                      _day('Mon'),
                      SizedBox(width: 12,
                          child: Spacer()),
                      _day('Tue'),
                      SizedBox(width: 12,
                          child: Spacer()),
                      _day('Wed'),
                      SizedBox(width: 12,
                          child: Spacer()),
                      _day('Tur'),
                      SizedBox(width: 12,
                          child: Spacer()),
                      _day('Fri'),
                    ],
                  ),
                ),
                //時間割
                Container(
                  child: Row(
                    children:[
                      //時間
                      Container(
                        width: 28,
                        height: 492,
                        child: Center(
                          child: Column(
                            children: [
                              Text('8:30',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10, color: Color(0xFF2E2E2E),),),
                              Container(
                                width: 24,
                                height: 54,
                                alignment: Alignment.center,
                                child: Text('1',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF2E2E2E),),),
                              ),
                              Text('10:15',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10, color: Color(0xFF2E2E2E),),),
                              Spacer(),
                              Text('10:25',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10, color: Color(0xFF2E2E2E),),),
                              Container(
                                width: 24,
                                height: 54,
                                alignment: Alignment.center,
                                child: Text('2',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF2E2E2E),),),
                              ),
                              Text('12:10',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10, color: Color(0xFF2E2E2E),),),
                              Spacer(),
                              Text('13:00',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10, color: Color(0xFF2E2E2E),),),
                              Container(
                                width: 24,
                                height: 54,
                                alignment: Alignment.center,
                                child: Text('3',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF2E2E2E),),),
                              ),
                              Text('14:45',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10, color: Color(0xFF2E2E2E),),),
                              Spacer(),
                              Text('14:55',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10, color: Color(0xFF2E2E2E),),),
                              Container(
                                width: 24,
                                height: 54,
                                alignment: Alignment.center,
                                child: Text('4',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF2E2E2E),),),
                              ),
                              Text('16:40',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10, color: Color(0xFF2E2E2E),),),
                              Spacer(),
                              Text('16:50',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10, color: Color(0xFF2E2E2E),),),
                              Container(
                                width: 24,
                                height: 54,
                                alignment: Alignment.center,
                                child: Text('5',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF2E2E2E),),),
                              ),
                              Text('18:35',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10, color: Color(0xFF2E2E2E),),),
                              Spacer(),
                              Text('18:45',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10, color: Color(0xFF2E2E2E),),),
                              Container(
                                width: 24,
                                height: 54,
                                alignment: Alignment.center,
                                child: Text('6',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF2E2E2E),),),
                              ),
                              Text('20:30',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10, color: Color(0xFF2E2E2E),),),
                            ],
                          ),
                        ),
                      ),
                      //コマ
                      Expanded(
                        child:Container(
                          width: double.infinity,
                          height: 492,
                          margin: const EdgeInsets.only(left: 4.0, right:32.0),
                          child: Column(
                            children: [
                              _period(),
                              SizedBox(height: 12,
                                  child: Spacer()),
                              _period(),
                              SizedBox(height: 12,
                                  child: Spacer()),
                              _period(),
                              SizedBox(height: 12,
                                  child: Spacer()),
                              _period(),
                              SizedBox(height: 12,
                                  child: Spacer()),
                              _period(),
                              SizedBox(height: 12,
                                  child: Spacer()),
                              _period(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //集中講義
                Container(
                  height: 180,
                  margin: const EdgeInsets.only(top:12.0),
                  child: Column(
                    children: [
                      //集中コース
                      Container(
                        height: 16,
                        alignment: Alignment.center,
                        child: Text('集中コース',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF2E2E2E),),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(left:28.0, right:28.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children:[
                              _intensiveCourse(),
                              _intensiveCourse(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label:'時間割'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), label:'単位'),
          BottomNavigationBarItem(icon: Icon(Icons.poll), label:'平均点'),
        ],
        fixedColor: Color(0xFFED6969),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Expanded _day(String day) {
    return (Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Text(
          day,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF2E2E2E),
          ),
        ),
      ),
    ));
  }

  Expanded _createLecture() {
    return (Expanded(
      child: SizedBox(
        width: double.infinity,
        height: 68,
        child: ElevatedButton(
          child: Text(
            '',
            style: TextStyle(
              fontSize: 8,
              color: Color(0xFF2E2E2E),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFFFFFFF),
            elevation: 0,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LectureDialog(),
                ));
            // LectureDialog(context,).showLectureDialog();
          },
        ),
      ),
    ));
  }

  Expanded _period() {
    return (Expanded(
      child: SizedBox(
        width: double.infinity,
        height: 68,
        child: Row(
          children: [
            _createLecture(),
            SizedBox(width: 12, child: Spacer()),
            _createLecture(),
            SizedBox(width: 12, child: Spacer()),
            _createLecture(),
            SizedBox(width: 12, child: Spacer()),
            _createLecture(),
            SizedBox(width: 12, child: Spacer()),
            _createLecture(),
          ],
        ),
      ),
    ));
  }

  Container _intensiveCourse() {
    return (Container(
      width: double.infinity,
      height: 32,
      margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: ElevatedButton(
        child: const Text(
          '全学自由研究ゼミナール',
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFF2E2E2E),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFFFF1A7),
          elevation: 0,
        ),
        onPressed: () {},
      ),
    ));
  }
}
