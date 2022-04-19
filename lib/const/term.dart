/*enum Term { s1, s2, a1, a2 }

extension TermExtension on Term {
  String get label {
    switch (this) {
      case Term.s1:
        return 'S1ターム';
      case Term.s2:
        return 'S2ターム';
      case Term.a1:
        return 'A1ターム';
      case Term.a2:
        return 'A2ターム';
    }
  }
}*/

enum YearTerm {
  oneS1,
  oneS2,
  oneA1,
  oneA2,
  twoS1,
  twoS2,
}

extension YearTermExtension on YearTerm {
  String get label {
    switch (this) {
      case YearTerm.oneS1:
        return '1年 S1ターム';
      case YearTerm.oneS2:
        return '1年 S2ターム';
      case YearTerm.oneA1:
        return '1年 A1ターム';
      case YearTerm.oneA2:
        return '1年 A2ターム';
      case YearTerm.twoS1:
        return '2年 S1ターム';
      case YearTerm.twoS2:
        return '2年 S2ターム';
    }
  }
}

enum OpenTerm { s, s1, s2, a, a1, a2 }

extension OpenTermExtension on OpenTerm {
  String get label {
    switch (this) {
      case OpenTerm.s:
        return 'S';
      case OpenTerm.s1:
        return 'S1';
      case OpenTerm.s2:
        return 'S2';
      case OpenTerm.a:
        return 'A';
      case OpenTerm.a1:
        return 'A1';
      case OpenTerm.a2:
        return 'A2';
    }
  }
}
