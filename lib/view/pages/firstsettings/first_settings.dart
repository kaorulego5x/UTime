import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utime/ViewModel/settingProvider/settingProvider.dart';
import 'package:utime/ViewModel/timetablesDataProvider/timetablesProvider.dart';
import 'package:utime/const/utime_colors.dart';
import 'package:utime/model/user_data.dart';
import 'package:utime/view/pages/firstsettings/custom_button.dart';

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
            const SettingTitle(title: '何年生ですか？'),
            const SettingSubTitle(),
            SizedBox(
              height: height / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _gradeCustomButton("1", height, context),
                  _gradeCustomButton("2", height, context),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Consumer _gradeCustomButton(
    String text,
    double height,
    BuildContext context,
  ) {
    return Consumer(builder: (context, ref, child) {
      return CustomButton(
        text: text + '年生',
        width: 100,
        height: height / 3 / 3,
        onPressed: () {
          Navigator.of(context).pushNamed('/courseSelection');
          ref.read(userFirstSettingProvider.notifier).setGrade(text);
        },
      );
    });
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
            const SettingTitle(title: '科類を選択して下さい'),
            const SettingSubTitle(),
            SizedBox(
              height: height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _courseCustomButton('理 Ⅰ', height, context),
                      _courseCustomButton('理 Ⅱ', height, context),
                      _courseCustomButton('理 Ⅲ', height, context),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _courseCustomButton('文 Ⅰ', height, context),
                      _courseCustomButton('文 Ⅱ', height, context),
                      _courseCustomButton('文 Ⅲ', height, context),
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

  Consumer _courseCustomButton(
      String text, double height, BuildContext context) {
    String course;
    if (text == '理 Ⅰ') {
      course = 's1';
    } else if (text == '理 Ⅱ') {
      course = 's2';
    } else if (text == '理 Ⅲ') {
      course = 's3';
    } else if (text == '文 Ⅰ') {
      course = 'l1';
    } else if (text == '文 Ⅱ') {
      course = 'l2';
    } else if (text == '文 Ⅲ') {
      course = 'l3';
    } else {
      throw (Exception);
    }
    return Consumer(builder: (context, ref, child) {
      return CustomButton(
        text: text,
        width: 80,
        height: height / 3 / 3,
        onPressed: () {
          Navigator.of(context).pushNamed('/yearTermSelection');
          ref.read(userFirstSettingProvider.notifier).setCourse(course);
        },
      );
    });
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
            const SettingTitle(title: '学期を選択してください'),
            const SettingSubTitle(),
            SizedBox(
              height: height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _yearTermButton('S 1', height, context),
                      _yearTermButton('S 2', height, context),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _yearTermButton('A 1', height, context),
                      _yearTermButton('A 2', height, context),
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

  Consumer _yearTermButton(String text, double height, BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      String yearTerm;
      if (text == 'S 1') {
        yearTerm = 's1';
      } else if (text == 'S 2') {
        yearTerm = 's2';
      } else if (text == 'A 1') {
        yearTerm = 'a1';
      } else if (text == 'A 2') {
        yearTerm = 'a2';
      } else {
        throw (Exception);
      }
      return CustomButton(
          text: text, width: 100, height: height / 3 / 3, onPressed: () async {
            final UserData userData = UserData();
            // provider にデータ取得
            ref.read(userFirstSettingProvider.notifier).setYearTerm(yearTerm);

            // 設定した学年と学期を選択。それをもとにデータを取得
            final String grade = ref.read(userFirstSettingProvider).grade;
            final String term = ref.read(userFirstSettingProvider).yearTerm;
            ref.read(timeTablesDisplayProvider.notifier).getTimetablesDataDisplay(grade+term);

            //ページ遷移
            Navigator.popUntil(context, ModalRoute.withName('/gradeSelection'));
            Navigator.of(context).pushNamed('/home');
      });
    });
  }
}
