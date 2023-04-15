// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lat_lng_address_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LatLngAddressRequestState {
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LatLngAddressRequestStateCopyWith<LatLngAddressRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatLngAddressRequestStateCopyWith<$Res> {
  factory $LatLngAddressRequestStateCopyWith(LatLngAddressRequestState value,
          $Res Function(LatLngAddressRequestState) then) =
      _$LatLngAddressRequestStateCopyWithImpl<$Res, LatLngAddressRequestState>;
  @useResult
  $Res call({String latitude, String longitude});
}

/// @nodoc
class _$LatLngAddressRequestStateCopyWithImpl<$Res,
        $Val extends LatLngAddressRequestState>
    implements $LatLngAddressRequestStateCopyWith<$Res> {
  _$LatLngAddressRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LatLngAddressRequestStateCopyWith<$Res>
    implements $LatLngAddressRequestStateCopyWith<$Res> {
  factory _$$_LatLngAddressRequestStateCopyWith(
          _$_LatLngAddressRequestState value,
          $Res Function(_$_LatLngAddressRequestState) then) =
      __$$_LatLngAddressRequestStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String latitude, String longitude});
}

/// @nodoc
class __$$_LatLngAddressRequestStateCopyWithImpl<$Res>
    extends _$LatLngAddressRequestStateCopyWithImpl<$Res,
        _$_LatLngAddressRequestState>
    implements _$$_LatLngAddressRequestStateCopyWith<$Res> {
  __$$_LatLngAddressRequestStateCopyWithImpl(
      _$_LatLngAddressRequestState _value,
      $Res Function(_$_LatLngAddressRequestState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$_LatLngAddressRequestState(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LatLngAddressRequestState implements _LatLngAddressRequestState {
  const _$_LatLngAddressRequestState({this.latitude = '', this.longitude = ''});

  @override
  @JsonKey()
  final String latitude;
  @override
  @JsonKey()
  final String longitude;

  @override
  String toString() {
    return 'LatLngAddressRequestState(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LatLngAddressRequestState &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LatLngAddressRequestStateCopyWith<_$_LatLngAddressRequestState>
      get copyWith => __$$_LatLngAddressRequestStateCopyWithImpl<
          _$_LatLngAddressRequestState>(this, _$identity);
}

abstract class _LatLngAddressRequestState implements LatLngAddressRequestState {
  const factory _LatLngAddressRequestState(
      {final String latitude,
      final String longitude}) = _$_LatLngAddressRequestState;

  @override
  String get latitude;
  @override
  String get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_LatLngAddressRequestStateCopyWith<_$_LatLngAddressRequestState>
      get copyWith => throw _privateConstructorUsedError;
}
