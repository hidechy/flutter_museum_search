// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lat_lng_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LatLngRequestState {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LatLngRequestStateCopyWith<LatLngRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatLngRequestStateCopyWith<$Res> {
  factory $LatLngRequestStateCopyWith(
          LatLngRequestState value, $Res Function(LatLngRequestState) then) =
      _$LatLngRequestStateCopyWithImpl<$Res, LatLngRequestState>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$LatLngRequestStateCopyWithImpl<$Res, $Val extends LatLngRequestState>
    implements $LatLngRequestStateCopyWith<$Res> {
  _$LatLngRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LatLngRequestStateCopyWith<$Res>
    implements $LatLngRequestStateCopyWith<$Res> {
  factory _$$_LatLngRequestStateCopyWith(_$_LatLngRequestState value,
          $Res Function(_$_LatLngRequestState) then) =
      __$$_LatLngRequestStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$_LatLngRequestStateCopyWithImpl<$Res>
    extends _$LatLngRequestStateCopyWithImpl<$Res, _$_LatLngRequestState>
    implements _$$_LatLngRequestStateCopyWith<$Res> {
  __$$_LatLngRequestStateCopyWithImpl(
      _$_LatLngRequestState _value, $Res Function(_$_LatLngRequestState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$_LatLngRequestState(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_LatLngRequestState implements _LatLngRequestState {
  const _$_LatLngRequestState({this.lat = 0.0, this.lng = 0.0});

  @override
  @JsonKey()
  final double lat;
  @override
  @JsonKey()
  final double lng;

  @override
  String toString() {
    return 'LatLngRequestState(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LatLngRequestState &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LatLngRequestStateCopyWith<_$_LatLngRequestState> get copyWith =>
      __$$_LatLngRequestStateCopyWithImpl<_$_LatLngRequestState>(
          this, _$identity);
}

abstract class _LatLngRequestState implements LatLngRequestState {
  const factory _LatLngRequestState({final double lat, final double lng}) =
      _$_LatLngRequestState;

  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$$_LatLngRequestStateCopyWith<_$_LatLngRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}
