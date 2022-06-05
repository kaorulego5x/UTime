import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utime/ViewModel/timetablesDataProvider/timetablesProvider.dart';

//<<<<<<< HEAD:lib/view/pages/Timetable/lecture_dialog.dart
import 'package:utime/ViewModel/lectureDialogDataProvider.dart';
import 'package:utime/model/lecture_dialog_list.dart';
import 'package:utime/const/utime_colors.dart';
import 'package:utime/const/utime_text_styles.dart';

import '../../widgets/dropdown_builder.dart';

/// TimetablesDisplayで授業のコマ押したときに出てくるダイアログ

enum DropDownType { openTerm, credits }

extension DropDownTypeExtension on DropDownType {
  String get label {
    switch (this) {
      case DropDownType.openTerm:
        return '開講区分';
      case DropDownType.credits:
        return '単位数';
    }
  }
}

class LectureDialog extends StatelessWidget {
  LectureDialog({
    Key? key,
    required this.day,
    required this.yearTerm,
    required this.period,
  }) : super(key: key);
  final String yearTerm;
  final String day;
  final String period;
  final LectureDialogList lectureDialogList = LectureDialogList();
  final UtimeColors utimeColors = UtimeColors();

  // List<bool> _isOpen = [true];
  final GlobalKey _widgetKey1 = GlobalKey();
  final GlobalKey _widgetKey2 = GlobalKey();
  final GlobalKey _widgetKey3 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 280,
        height: 574,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            //色がついている部分
            Consumer(
              builder: (context, ref, child) {
                final Color dialogColor = ref.watch(timeTablesDisplayProvider).lectureDialogColor;
                return Container(
                  height: 256,
                  width: 280,
                  decoration: BoxDecoration(
                    color: dialogColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    children: [
                      //曜限
                      Container(
                        margin: const EdgeInsets.only(top: 24, bottom: 12),
                        child: Text(
                          day + ' ' + period,
                          textAlign: TextAlign.center,
                          style: UtimeTextStyles.lectureDialogDayPeriod,
                        ),
                      ),
                      //科目区分ドロップダウンボタン
                      Container(
                        key: _widgetKey1,
                        margin: const EdgeInsets.only(bottom: 8),
                        height: 48,
                        child: _showLargeDropdown(
                          context,
                          title: '科目区分',
                        ),
                      ),

                      //授業情報
                      _lectureNameField(),
                      _teacherNameField(),
                      _classroomField(),
                    ],
                  ),
                );
              },
            ), //白い部分
            Container(
              height: 318,
              width: 280,
              padding: const EdgeInsets.only(right: 20, left: 20),
              decoration: const BoxDecoration(
                color: UtimeColors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  //ドロップダウンボタン
                  Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 12),
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //開講区分
                        Container(
                          key: _widgetKey2,
                          child: _openTermDropDown(
                            context,
                            dropDownType: DropDownType.openTerm,
                          ),
                        ),
                        const SizedBox(width: 24, child: Spacer()),
                        //単位数
                        Container(
                          key: _widgetKey3,
                          child: _creditsNumberDropdown(
                            context,
                            dropDownType: DropDownType.credits,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //メモ
                  // TODO:implement Colors
                  _memo(UtimeColors.subject1),
                  // _memo(_dataToShow['dialogColor']),
                  //授業時間ボタン
                  Container(
                    width: 232,
                    margin: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _classTimeToggle(),
                        //点数入力欄
                        /* Container(
                                  width: 28,
                                  margin: const EdgeInsets.only(left: 12),
                                  child: _section('点数')),
                              Container(
                                width: 80,
                                height: 32,
                                margin: const EdgeInsets.only(left: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(color: dialogColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  style: const TextStyle(
                                    color: UtimeColors.textColor,
                                    fontSize: 8,
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: "",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            */
                        // TODO:Design はおまかせします
                        Consumer(
                          builder: (context, ref, child) {
                            return OutlinedButton(
                              child: const Text(
                                '決定',
                                style: TextStyle(color: UtimeColors.textColor),
                              ),
                              onPressed: () {
                                // 変更内容をDBに送信
                                ref.read(timeTablesDisplayProvider.notifier).setDialogData(yearTerm: yearTerm, day: day, period: period);
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                        //クリアボタン
                        resetButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //セクション名
  Text _section(String section) {
    return (Text(
      section,
      textAlign: TextAlign.center,
      style: UtimeTextStyles.lectureDialogSectionName,
    ));
  }

  /// 開講科目名のテキストフォームフィールド
  Container _lectureNameField() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 32,
            width: 80,
            child: Text(
              '開講科目名',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: UtimeColors.white.withOpacity(0.75),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, Widget? child) {
              final String initialValue = ref.read(timeTablesDisplayProvider).lectureDataDisplay[day][period]['lectureName'] ?? '';
              return Container(
                alignment: Alignment.center,
                height: 32,
                width: 160,
                child: TextFormField(
                  initialValue: initialValue,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: UtimeTextStyles.lectureDialogTitle,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    isCollapsed: true,
                  ),
                  onChanged: (String value) {
                    ref.read(timeTablesDisplayProvider.notifier).changeLectureName(value, day, period);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// 教師名のテキストフォームフィールド
  Container _teacherNameField() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 32,
            width: 80,
            child: Text(
              '教員名',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: UtimeColors.white.withOpacity(0.75),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, Widget? child) {
              final String initialValue = ref.read(timeTablesDisplayProvider).lectureDataDisplay[day][period]['teacherName'] ?? '';
              return Container(
                alignment: Alignment.center,
                height: 32,
                width: 160,
                child: TextFormField(
                  initialValue: initialValue,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: UtimeTextStyles.lectureDialogTitle,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    isCollapsed: true,
                  ),
                  onChanged: (String value) {
                    ref.read(timeTablesDisplayProvider.notifier).changeTeacherName(value, day, period);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// 教室のテキストフォームフィールド
  Container _classroomField() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 32,
            width: 80,
            child: Text(
              '教室',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: UtimeColors.white.withOpacity(0.75),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, Widget? child) {
              final String initialValue = ref.read(timeTablesDisplayProvider).lectureDataDisplay[day][period]['classroom'] ?? '';
              return Container(
                alignment: Alignment.center,
                height: 32,
                width: 160,
                child: TextFormField(
                  initialValue: initialValue,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: UtimeTextStyles.lectureDialogTitle,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    isCollapsed: true,
                  ),
                  onChanged: (String value) {
                    ref.watch(timeTablesDisplayProvider.notifier).changeClassroom(value, day, period);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// 科目区分のドロップダウンボタン
  Column _showLargeDropdown(
    BuildContext context, {
    required String title,
  }) {
    return Column(
      children: [
        //セクション名
        Container(
          height: 12,
          margin: const EdgeInsets.only(bottom: 4),
          child: Text(
            '科目区分',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: UtimeColors.white.withOpacity(0.75),
            ),
          ),
        ),
        //ドロップダウンボタン
        Consumer(
          builder: (context, ref, child) {
            final Color dialogColor = ref.watch(lectureDialogDataProvider).lectureData['dialogColor'] ?? UtimeColors.subject1;
            final String selectedSubjectType = ref.watch(timeTablesDisplayProvider).lectureDataDisplay[day][period]['subjectType'] ?? '選択して下さい';
            return GestureDetector(
              onTap: () {
                RenderBox box = _getWidgetPosition('科目区分');
                DropdownBuilder(
                  context,
                ).showSubjectTypeDropdownList(216, dialogColor, box, day, period);
              },
              child: Container(
                height: 32,
                width: 216,
                decoration: BoxDecoration(
                  color: UtimeColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    selectedSubjectType,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      // TODO:文字色まで変化させると見ずらい
                      // 色も変える必要があるかも？
                      // パステルカラーバックグラウンド　x 白文字　は　見ずらい
                      color: ref.watch(timeTablesDisplayProvider).lectureDialogColor,
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }

  /// 開講区分のドロップダウンボタン
  Consumer _openTermDropDown(
    BuildContext context, {
    required DropDownType dropDownType,
  }) {
    return Consumer(
      builder: (context, ref, child) {
        final Color dialogColor = ref.watch(timeTablesDisplayProvider).lectureDialogColor;
        final String selectedOpenTerm = ref.watch(timeTablesDisplayProvider).lectureDataDisplay[day][period]['openTerm'] ?? '選択して下さい';
        return Column(
          children: [
            Container(
              height: 12,
              margin: const EdgeInsets.only(bottom: 4),
              child: _section(dropDownType.label),
            ),
            GestureDetector(
              onTap: () {
                RenderBox box = _getWidgetPosition('開講区分');
                DropdownBuilder(
                  context,
                ).showOpenTermDropdownList(108, dialogColor, box, day, period);
              },
              child: Container(
                height: 32,
                width: 108,
                decoration: BoxDecoration(
                  color: dialogColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    selectedOpenTerm,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: UtimeColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// 単位数のドロップダウン
  Consumer _creditsNumberDropdown(
    BuildContext context, {
    required DropDownType dropDownType,
  }) {
    return Consumer(builder: (context, ref, child) {
      final Color dialogColor = ref.watch(timeTablesDisplayProvider).lectureDialogColor;
      final String selectedCreditsNumber = ref.watch(timeTablesDisplayProvider).lectureDataDisplay[day][period]['creditNumber'] ?? '選択して下さい';
      return Column(
        children: [
          //セクション名
          Container(
            height: 12,
            margin: const EdgeInsets.only(bottom: 4),
            child: _section(dropDownType.label),
          ),
          //ドロップダウンボタン
          GestureDetector(
            onTap: () {
              RenderBox box = _getWidgetPosition('単位数');
              DropdownBuilder(
                context,
              ).showCreditsNumberDropdownList(108, dialogColor, box, day, period);
            },
            child: Container(
              height: 32,
              width: 108,
              decoration: BoxDecoration(
                color: dialogColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  selectedCreditsNumber,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: UtimeColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  /// clearButton
  Consumer resetButton() {
    return Consumer(
      builder: (context, ref, child) {
        return IconButton(
          iconSize: 24,
          color: UtimeColors.deleteIcon,
          icon: const Icon(Icons.delete),
          onPressed: () {
            ref.watch(timeTablesDisplayProvider.notifier).resetDialogData(day, period);
            ref.watch(timeTablesDisplayProvider.notifier).changeDialogColor(day, period);
          },
        );
      },
    );
  }

  /// widgetの位置を取得
  _getWidgetPosition(String title) {
    final RenderBox renderBox1 =
        _widgetKey1.currentContext?.findRenderObject() as RenderBox;
    final RenderBox renderBox2 =
        _widgetKey2.currentContext?.findRenderObject() as RenderBox;
    final RenderBox renderBox3 =
        _widgetKey3.currentContext?.findRenderObject() as RenderBox;

    final Offset offset1 = renderBox1.localToGlobal(Offset.zero);
    final Offset offset2 = renderBox2.localToGlobal(Offset.zero);
    final Offset offset3 = renderBox3.localToGlobal(Offset.zero);
    //print('Offset: ${offset.dx}, ${offset.dy}');
    //print('Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
    if (title == '科目区分') {
      return renderBox1;
    } else if (title == '開講区分') {
      return renderBox2;
    } else if (title == '単位数') {
      return renderBox3;
    } else {
      throw Exception('title is ' + title);
    }
  }

  /// メモウィジェット
  Column _memo(Color dialogColor) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 4, bottom: 4),
            child: _section('メモ')),
        Container(
          height: 144,
          width: 232,
          padding: const EdgeInsets.only(right: 12, left: 12),
          decoration: BoxDecoration(
            border: Border.all(color: dialogColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Consumer(
            builder: (context, ref, child) {
              return TextFormField(
                initialValue:
                    ref.watch(lectureDialogDataProvider).lectureData['notes'],
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: const TextStyle(
                  color: UtimeColors.textColor,
                  fontSize: 16,
                ),
                decoration: const InputDecoration(
                  hintText: "メモを入力",
                  hintStyle: TextStyle(fontSize: 12),
                  border: InputBorder.none,
                ),
                onChanged: (String value) {
                  ref.read(timeTablesDisplayProvider.notifier).changeNotes(value, day, period);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  /// 授業時間のトグルボタン
  SizedBox _classTimeToggle() {
    return SizedBox(
      height: 32,
      width: 108,
      child: Consumer(
        builder: (context, ref, child) {
          final Color dialogColor = ref.watch(timeTablesDisplayProvider).lectureDialogColor;
          return ToggleButtons(
            children: const [
              Text('105分'),
              Text('90分'),
            ],
            textStyle: const TextStyle(fontSize: 12, color: UtimeColors.textColor),
            borderWidth: 1,
            borderColor: dialogColor,
            //枠の色
            borderRadius: BorderRadius.circular(8),
            selectedColor: UtimeColors.white,
            //選択されている方の文字色
            fillColor: dialogColor,
            //選択されている方の背景色
            selectedBorderColor: dialogColor,
            //選択されている方の枠の色
            onPressed: (int index) {
              ref.watch(timeTablesDisplayProvider.notifier).changeClassTime(index, day, period);
            },
            isSelected: ref.watch(timeTablesDisplayProvider).selectedClassTime,
          );
        },
      ),
    );
  }
}
