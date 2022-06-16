import 'package:flutter/cupertino.dart';

import '../main.dart';
import '../view/pages/firstsettings/first_settings.dart';

/// Pageのまとめ

class Pages {
  static final Map<String, Widget Function(BuildContext)> pages = {
    '/gradeSelection': (BuildContext context) => const GradeSelection(),
    '/courseSelection': (BuildContext context) => const CourseSelection(),
    '/yearTermSelection': (BuildContext context) => const YearTermSelection(),
    '/home' : (BuildContext context) => const HomePage()
  };
}