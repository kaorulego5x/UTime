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
    return SizedBox(
      child: Container(
        height: 120,
        width: 148,
        margin: const EdgeInsets.only(top: 10),
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
              Container(
                alignment: Alignment.center,
                child: Stack(children: <Widget>[
                  Container(
                    height: 12,
                    margin: const EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: UtimeColors.backgroundColor,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      term,
                      style: TextStyle(
                        fontSize: 16,
                        color: UtimeColors.textColor,
                      ),
                    ),
                  ),
                ])
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '重率1:',
                        style: TextStyle(
                          fontSize: 16,
                          color: UtimeColors.textColor,
                        ),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.only(right: 32),
                      child: Text(
                        one,
                        style: TextStyle(
                          fontSize: 16,
                          color: UtimeColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '重率0.1:',
                        style: TextStyle(
                          fontSize: 16,
                          color: UtimeColors.textColor,
                        ),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.only(right: 32),
                      child: Text(
                        zeroPointOne,
                        style: TextStyle(
                          fontSize: 16,
                          color: UtimeColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
      )
    );
  }
}
