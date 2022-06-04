// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timetablesProvider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimetablesData {
  Map<dynamic, dynamic> get lectureDataDisplay =>
      throw _privateConstructorUsedError;
  String get yearTerm => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimetablesDataCopyWith<TimetablesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetablesDataCopyWith<$Res> {
  factory $TimetablesDataCopyWith(
          TimetablesData value, $Res Function(TimetablesData) then) =
      _$TimetablesDataCopyWithImpl<$Res>;
  $Res call({Map<dynamic, dynamic> lectureDataDisplay, String yearTerm});
}

/// @nodoc
class _$TimetablesDataCopyWithImpl<$Res>
    implements $TimetablesDataCopyWith<$Res> {
  _$TimetablesDataCopyWithImpl(this._value, this._then);

  final TimetablesData _value;
  // ignore: unused_field
  final $Res Function(TimetablesData) _then;

  @override
  $Res call({
    Object? lectureDataDisplay = freezed,
    Object? yearTerm = freezed,
  }) {
    return _then(_value.copyWith(
      lectureDataDisplay: lectureDataDisplay == freezed
          ? _value.lectureDataDisplay
          : lectureDataDisplay // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      yearTerm: yearTerm == freezed
          ? _value.yearTerm
          : yearTerm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TimetablesDataCopyWith<$Res>
    implements $TimetablesDataCopyWith<$Res> {
  factory _$$_TimetablesDataCopyWith(
          _$_TimetablesData value, $Res Function(_$_TimetablesData) then) =
      __$$_TimetablesDataCopyWithImpl<$Res>;
  @override
  $Res call({Map<dynamic, dynamic> lectureDataDisplay, String yearTerm});
}

/// @nodoc
class __$$_TimetablesDataCopyWithImpl<$Res>
    extends _$TimetablesDataCopyWithImpl<$Res>
    implements _$$_TimetablesDataCopyWith<$Res> {
  __$$_TimetablesDataCopyWithImpl(
      _$_TimetablesData _value, $Res Function(_$_TimetablesData) _then)
      : super(_value, (v) => _then(v as _$_TimetablesData));

  @override
  _$_TimetablesData get _value => super._value as _$_TimetablesData;

  @override
  $Res call({
    Object? lectureDataDisplay = freezed,
    Object? yearTerm = freezed,
  }) {
    return _then(_$_TimetablesData(
      lectureDataDisplay: lectureDataDisplay == freezed
          ? _value._lectureDataDisplay
          : lectureDataDisplay // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      yearTerm: yearTerm == freezed
          ? _value.yearTerm
          : yearTerm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TimetablesData implements _TimetablesData {
  const _$_TimetablesData(
      {final Map<dynamic, dynamic> lectureDataDisplay = const {},
      this.yearTerm = ''})
      : _lectureDataDisplay = lectureDataDisplay;

  final Map<dynamic, dynamic> _lectureDataDisplay;
  @override
  @JsonKey()
  Map<dynamic, dynamic> get lectureDataDisplay {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lectureDataDisplay);
  }

  @override
  @JsonKey()
  final String yearTerm;

  @override
  String toString() {
    return 'TimetablesData(lectureDataDisplay: $lectureDataDisplay, yearTerm: $yearTerm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimetablesData &&
            const DeepCollectionEquality()
                .equals(other._lectureDataDisplay, _lectureDataDisplay) &&
            const DeepCollectionEquality().equals(other.yearTerm, yearTerm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lectureDataDisplay),
      const DeepCollectionEquality().hash(yearTerm));

  @JsonKey(ignore: true)
  @override
  _$$_TimetablesDataCopyWith<_$_TimetablesData> get copyWith =>
      __$$_TimetablesDataCopyWithImpl<_$_TimetablesData>(this, _$identity);
}

abstract class _TimetablesData implements TimetablesData {
  const factory _TimetablesData(
      {final Map<dynamic, dynamic> lectureDataDisplay,
      final String yearTerm}) = _$_TimetablesData;

  @override
  Map<dynamic, dynamic> get lectureDataDisplay =>
      throw _privateConstructorUsedError;
  @override
  String get yearTerm => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TimetablesDataCopyWith<_$_TimetablesData> get copyWith =>
      throw _privateConstructorUsedError;
}
