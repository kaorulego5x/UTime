enum Term { s1, s2, a1, a2 }

extension TermExtension on Term {
  String get string {
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
}
