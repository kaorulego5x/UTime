import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:utime/model/user_data.dart';

part 'settingProvider.freezed.dart';

final userFirstSettingProvider = StateNotifierProvider<UserFirstSettingNotifier, UserFirstSetting>((ref) {
  return UserFirstSettingNotifier();
});

@freezed
class UserFirstSetting with _$UserFirstSetting {
  const factory UserFirstSetting({
    @Default('') String grade,
    @Default('') String yearTerm,
    @Default('') String course,
  }) = _UserFirstSetting;
}

class UserFirstSettingNotifier extends StateNotifier<UserFirstSetting> {
  UserFirstSettingNotifier() : super(const UserFirstSetting());
  final UserData userData = UserData();

  void setGrade(String grade) {
    state = state.copyWith(grade: grade);
    userData.setGrade(grade);
  }

  void setCourse (String course) {
    state = state.copyWith(course: course);
    userData.setCourse(course);
  }


  void setYearTerm(String yearTerm) {
    state = state.copyWith(yearTerm: yearTerm);
  }

}