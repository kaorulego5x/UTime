import 'package:flutter/material.dart';
import 'package:utime/const/utime_colors.dart';

/// 学年選択
class GradeSelection extends StatelessWidget {
  const GradeSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              '何年生ですか？',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 50),
              child: Text('設定から変更できます'),
            ),
            SizedBox(
              height: height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/courseSelection');
                    },
                    style: ElevatedButton.styleFrom(
                      // TODO: Implement Color
                      primary: UtimeColors.subject1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: SizedBox(
                      width: width * 0.7,
                      height: 125,
                      child: const Center(
                        child: Text(
                          '１年生',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/courseSelection');
                    },
                    style: ElevatedButton.styleFrom(
                      // TODO:Implement Colors
                      primary: UtimeColors.subject1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: SizedBox(
                      width: width * 0.7,
                      height: 125,
                      child: const Center(
                        child: Text(
                          '２年生',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

/// Course(科類) 選択
class CourseSelection extends StatelessWidget {
  const CourseSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              '科類を選択して下さい',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 50),
              child: Text('設定から変更できます'),
            ),
            SizedBox(
              height: height / 3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _courseWidget(context, '理 Ⅰ', width),
                      _courseWidget(context, '理 Ⅱ', width),
                      _courseWidget(context, '理 Ⅲ', width),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _courseWidget(context, '文 Ⅰ', width),
                      _courseWidget(context, '文 Ⅱ', width),
                      _courseWidget(context, '文 Ⅲ', width),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Padding _courseWidget(BuildContext context, String course, double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          width: (width - 90) / 3,
          height: (width - 90) / 3,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: UtimeColors.subject1,
              elevation: 0,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/yearTermSelection');
            },
            child: Text(
              course,
              style: const TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

/// 学期を選択
class YearTermSelection extends StatelessWidget {
  const YearTermSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              '学期を選択して下さい',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 50),
              child: Text('設定から変更できます'),
            ),
            SizedBox(
              height: height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _yearTermWidget('S 1', width),
                      _yearTermWidget('S 2', width),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _yearTermWidget('A 1', width),
                      _yearTermWidget('A 2', width),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  SizedBox _yearTermWidget(String course, double width) {
    return SizedBox(
      width: (width - 50) / 2,
      height: (width - 50) / 4,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: UtimeColors.subject1,
            elevation: 0,
          ),
          onPressed: () {},
          child: Center(
            child: Text(
              course,
              style: const TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
