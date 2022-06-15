import 'package:flutter/material.dart';
import 'package:utime/const/utime_colors.dart';
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
                  _gradeCustomButton('１年生', height, context),
                  _gradeCustomButton('２年生', height, context),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  CustomButton _gradeCustomButton(
      String text, double height, BuildContext context,) {
    return CustomButton(
      text: text,
      width: 100,
      height: height / 3 / 3,
      onPressed: () {
        Navigator.of(context).pushNamed('/courseSelection');
      },
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

  CustomButton _courseCustomButton(String text, double height, BuildContext context) {
    return CustomButton(
      text: text,
      width: 80,
      height: height / 3 / 3,
      onPressed: () {
        Navigator.of(context).pushNamed('/yearTermSelection');
      },
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

  CustomButton _yearTermButton (String text, double height, BuildContext context){
    return CustomButton(text: text, width: 100, height: height / 3 / 3, onPressed: () {});
  }

}
