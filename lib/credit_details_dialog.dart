import 'package:flutter/material.dart';
import 'package:utime/modal_overlay.dart';
import 'package:utime/utime_colors.dart';

class CreditDetailsDialog {
  final BuildContext context;
  final String title;
  CreditDetailsDialog(this.context, this.title) : super();

  /*
   * 表示
   */
  void showCreditDetailsDialog() {
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
                    child: Text(
                      title,
                      style: const TextStyle(
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
