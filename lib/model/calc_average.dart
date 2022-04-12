// import 'package:flutter/material.dart';

class CalcAverage {
  // const CalcAverage({Key? key}) : super(key: key);
  // final String term;
  // final String one;
  // final String zeroPointOne;
  // const CalcAverage(this.term, this.one, this.zeroPointOne);

  // 0点算入しない基本平均点を計算する関数
  double CalcBaseAverageWithout0(userData){
    switch(userData["course"]){
      case "l1":
        return CalcBaseAverageWithout0l1(userData);
      case "l2":
        return CalcBaseAverageWithout0l2(userData);
      case "l3":
        return CalcBaseAverageWithout0l3(userData);
      case "s1":
        return CalcBaseAverageWithout0s1(userData);
      case "s2":
        return CalcBaseAverageWithout0s2s3(userData);
      case "s3":
        return CalcBaseAverageWithout0s2s3(userData);
      
      default:
        return 0;
    }

  }

  double CalcBaseAverageWithout0l1(userData){
    double averageTop = 0; // 基本平均点の分子
    double avarageBottom = 0; // 基本平均点の分母
    return 1.0;
  }

  double CalcBaseAverageWithout0l2(userData){
    double averageTop = 0; // 基本平均点の分子
    double avarageBottom = 0; // 基本平均点の分母
    return 1.0;
  }
  double CalcBaseAverageWithout0l3(userData){
    double averageTop = 0; // 基本平均点の分子
    double avarageBottom = 0; // 基本平均点の分母
    return 1.0;
  }

  double CalcBaseAverageWithout0s1(userData){
    double averageTop = 0; // 基本平均点の分子
    double avarageBottom = 0; // 基本平均点の分母
    return 1.0;
  }

  /// 理2と理3は差はない
  double CalcBaseAverageWithout0s2s3(userData){
    double averageTop = 0; // 基本平均点の分子
    double avarageBottom = 0; // 基本平均点の分母
    return 1.0;
  }


}