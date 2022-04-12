enum Term { s1, s2, a1, a2 }

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
