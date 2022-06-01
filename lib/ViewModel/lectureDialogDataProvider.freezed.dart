// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lectureDialogDataProvider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LectureDialogData {
  Map<String, dynamic> get lectureData => throw _privateConstructorUsedError;
  String get day => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LectureDialogDataCopyWith<LectureDialogData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LectureDialogDataCopyWith<$Res> {
  factory $LectureDialogDataCopyWith(
          LectureDialogData value, $Res Function(LectureDialogData) then) =
      _$LectureDialogDataCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> lectureData, String day, String period});
}

/// @nodoc
class _$LectureDialogDataCopyWithImpl<$Res>
    implements $LectureDialogDataCopyWith<$Res> {
  _$LectureDialogDataCopyWithImpl(this._value, this._then);

  final LectureDialogData _value;
  // ignore: unused_field
  final $Res Function(LectureDialogData) _then;

  @override
  $Res call({
    Object? lectureData = freezed,
    Object? day = freezed,
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      lectureData: lectureData == freezed
          ? _value.lectureData
          : lectureData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LectureDialogDataCopyWith<$Res>
    implements $LectureDialogDataCopyWith<$Res> {
  factory _$$_LectureDialogDataCopyWith(_$_LectureDialogData value,
          $Res Function(_$_LectureDialogData) then) =
      __$$_LectureDialogDataCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, dynamic> lectureData, String day, String period});
}

/// @nodoc
class __$$_LectureDialogDataCopyWithImpl<$Res>
    extends _$LectureDialogDataCopyWithImpl<$Res>
    implements _$$_LectureDialogDataCopyWith<$Res> {
  __$$_LectureDialogDataCopyWithImpl(
      _$_LectureDialogData _value, $Res Function(_$_LectureDialogData) _then)
      : super(_value, (v) => _then(v as _$_LectureDialogData));

  @override
  _$_LectureDialogData get _value => super._value as _$_LectureDialogData;

  @override
  $Res call({
    Object? lectureData = freezed,
    Object? day = freezed,
    Object? period = freezed,
  }) {
    return _then(_$_LectureDialogData(
      lectureData: lectureData == freezed
          ? _value._lectureData
          : lectureData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LectureDialogData implements _LectureDialogData {
  const _$_LectureDialogData(
      {final Map<String, dynamic> lectureData = const {},
      this.day = '',
      this.period = ''})
      : _lectureData = lectureData;

  final Map<String, dynamic> _lectureData;
  @override
  @JsonKey()
  Map<String, dynamic> get lectureData {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lectureData);
  }

  @override
  @JsonKey()
  final String day;
  @override
  @JsonKey()
  final String period;

  @override
  String toString() {
    return 'LectureDialogData(lectureData: $lectureData, day: $day, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LectureDialogData &&
            const DeepCollectionEquality()
                .equals(other._lectureData, _lectureData) &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other.period, period));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lectureData),
      const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(period));

  @JsonKey(ignore: true)
  @override
  _$$_LectureDialogDataCopyWith<_$_LectureDialogData> get copyWith =>
      __$$_LectureDialogDataCopyWithImpl<_$_LectureDialogData>(
          this, _$identity);
}

abstract class _LectureDialogData implements LectureDialogData {
  const factory _LectureDialogData(
      {final Map<String, dynamic> lectureData,
      final String day,
      final String period}) = _$_LectureDialogData;

  @override
  Map<String, dynamic> get lectureData => throw _privateConstructorUsedError;
  @override
  String get day => throw _privateConstructorUsedError;
  @override
  String get period => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LectureDialogDataCopyWith<_$_LectureDialogData> get copyWith =>
      throw _privateConstructorUsedError;
}
