import 'package:flutter/material.dart';
import 'package:utime/view/widgets/modal_overlay.dart';
import 'package:utime/const/utime_colors.dart';

class RequiredCreditsDialog {
  BuildContext context;
  RequiredCreditsDialog(this.context) : super();

  /*
   * 表示
   */
  void showRequiredCreditsDialog() {
    Navigator.push(
        context,
        ModalOverlay(
          Center(
            child: Container(
              width: 280,
              height: 574,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: UtimeColors.white),
              child: Column(
                children: [
                  Container(
                    width: 280,
                    height: 60,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12),
                        ),
                        color: UtimeColors.backgroundColor),
                    alignment: Alignment.center,
                    child: const Text(
                      '必要単位数',
                      style: TextStyle(
                        fontSize: 18,
                        color: UtimeColors.textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //backボタンを有効にするかどうか
          isAndroidBackEnable: true,
        ));
  }

  /*
   * 非表示
   */
  void hideCustomDialog() {
    Navigator.of(context).pop();
  }

  void setState(Null Function() param0) {}
}
