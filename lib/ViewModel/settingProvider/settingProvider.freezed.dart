// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settingProvider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserFirstSetting {
  String get grade => throw _privateConstructorUsedError;
  String get yearTerm => throw _privateConstructorUsedError;
  String get course => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserFirstSettingCopyWith<UserFirstSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFirstSettingCopyWith<$Res> {
  factory $UserFirstSettingCopyWith(
          UserFirstSetting value, $Res Function(UserFirstSetting) then) =
      _$UserFirstSettingCopyWithImpl<$Res>;
  $Res call({String grade, String yearTerm, String course});
}

/// @nodoc
class _$UserFirstSettingCopyWithImpl<$Res>
    implements $UserFirstSettingCopyWith<$Res> {
  _$UserFirstSettingCopyWithImpl(this._value, this._then);

  final UserFirstSetting _value;
  // ignore: unused_field
  final $Res Function(UserFirstSetting) _then;

  @override
  $Res call({
    Object? grade = freezed,
    Object? yearTerm = freezed,
    Object? course = freezed,
  }) {
    return _then(_value.copyWith(
      grade: grade == freezed
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      yearTerm: yearTerm == freezed
          ? _value.yearTerm
          : yearTerm // ignore: cast_nullable_to_non_nullable
              as String,
      course: course == freezed
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserFirstSettingCopyWith<$Res>
    implements $UserFirstSettingCopyWith<$Res> {
  factory _$$_UserFirstSettingCopyWith(
          _$_UserFirstSetting value, $Res Function(_$_UserFirstSetting) then) =
      __$$_UserFirstSettingCopyWithImpl<$Res>;
  @override
  $Res call({String grade, String yearTerm, String course});
}

/// @nodoc
class __$$_UserFirstSettingCopyWithImpl<$Res>
    extends _$UserFirstSettingCopyWithImpl<$Res>
    implements _$$_UserFirstSettingCopyWith<$Res> {
  __$$_UserFirstSettingCopyWithImpl(
      _$_UserFirstSetting _value, $Res Function(_$_UserFirstSetting) _then)
      : super(_value, (v) => _then(v as _$_UserFirstSetting));

  @override
  _$_UserFirstSetting get _value => super._value as _$_UserFirstSetting;

  @override
  $Res call({
    Object? grade = freezed,
    Object? yearTerm = freezed,
    Object? course = freezed,
  }) {
    return _then(_$_UserFirstSetting(
      grade: grade == freezed
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      yearTerm: yearTerm == freezed
          ? _value.yearTerm
          : yearTerm // ignore: cast_nullable_to_non_nullable
              as String,
      course: course == freezed
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserFirstSetting implements _UserFirstSetting {
  const _$_UserFirstSetting(
      {this.grade = '', this.yearTerm = '', this.course = ''});

  @override
  @JsonKey()
  final String grade;
  @override
  @JsonKey()
  final String yearTerm;
  @override
  @JsonKey()
  final String course;

  @override
  String toString() {
    return 'UserFirstSetting(grade: $grade, yearTerm: $yearTerm, course: $course)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserFirstSetting &&
            const DeepCollectionEquality().equals(other.grade, grade) &&
            const DeepCollectionEquality().equals(other.yearTerm, yearTerm) &&
            const DeepCollectionEquality().equals(other.course, course));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(grade),
      const DeepCollectionEquality().hash(yearTerm),
      const DeepCollectionEquality().hash(course));

  @JsonKey(ignore: true)
  @override
  _$$_UserFirstSettingCopyWith<_$_UserFirstSetting> get copyWith =>
      __$$_UserFirstSettingCopyWithImpl<_$_UserFirstSetting>(this, _$identity);
}

abstract class _UserFirstSetting implements UserFirstSetting {
  const factory _UserFirstSetting(
      {final String grade,
      final String yearTerm,
      final String course}) = _$_UserFirstSetting;

  @override
  String get grade => throw _privateConstructorUsedError;
  @override
  String get yearTerm => throw _privateConstructorUsedError;
  @override
  String get course => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserFirstSettingCopyWith<_$_UserFirstSetting> get copyWith =>
      throw _privateConstructorUsedError;
}
