// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'polyline_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PolylineResponseState {
  LatLngBounds? get bounds => throw _privateConstructorUsedError;
  String get distance => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;
  List<PointLatLng> get polylinePoints => throw _privateConstructorUsedError;
  dynamic get southwestLat => throw _privateConstructorUsedError;
  dynamic get southwestLng => throw _privateConstructorUsedError;
  dynamic get northeastLat => throw _privateConstructorUsedError;
  dynamic get northeastLng => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PolylineResponseStateCopyWith<PolylineResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PolylineResponseStateCopyWith<$Res> {
  factory $PolylineResponseStateCopyWith(PolylineResponseState value,
          $Res Function(PolylineResponseState) then) =
      _$PolylineResponseStateCopyWithImpl<$Res, PolylineResponseState>;
  @useResult
  $Res call(
      {LatLngBounds? bounds,
      String distance,
      String duration,
      List<PointLatLng> polylinePoints,
      dynamic southwestLat,
      dynamic southwestLng,
      dynamic northeastLat,
      dynamic northeastLng});
}

/// @nodoc
class _$PolylineResponseStateCopyWithImpl<$Res,
        $Val extends PolylineResponseState>
    implements $PolylineResponseStateCopyWith<$Res> {
  _$PolylineResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bounds = freezed,
    Object? distance = null,
    Object? duration = null,
    Object? polylinePoints = null,
    Object? southwestLat = freezed,
    Object? southwestLng = freezed,
    Object? northeastLat = freezed,
    Object? northeastLng = freezed,
  }) {
    return _then(_value.copyWith(
      bounds: freezed == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as LatLngBounds?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      polylinePoints: null == polylinePoints
          ? _value.polylinePoints
          : polylinePoints // ignore: cast_nullable_to_non_nullable
              as List<PointLatLng>,
      southwestLat: freezed == southwestLat
          ? _value.southwestLat
          : southwestLat // ignore: cast_nullable_to_non_nullable
              as dynamic,
      southwestLng: freezed == southwestLng
          ? _value.southwestLng
          : southwestLng // ignore: cast_nullable_to_non_nullable
              as dynamic,
      northeastLat: freezed == northeastLat
          ? _value.northeastLat
          : northeastLat // ignore: cast_nullable_to_non_nullable
              as dynamic,
      northeastLng: freezed == northeastLng
          ? _value.northeastLng
          : northeastLng // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PolylineResponseStateCopyWith<$Res>
    implements $PolylineResponseStateCopyWith<$Res> {
  factory _$$_PolylineResponseStateCopyWith(_$_PolylineResponseState value,
          $Res Function(_$_PolylineResponseState) then) =
      __$$_PolylineResponseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LatLngBounds? bounds,
      String distance,
      String duration,
      List<PointLatLng> polylinePoints,
      dynamic southwestLat,
      dynamic southwestLng,
      dynamic northeastLat,
      dynamic northeastLng});
}

/// @nodoc
class __$$_PolylineResponseStateCopyWithImpl<$Res>
    extends _$PolylineResponseStateCopyWithImpl<$Res, _$_PolylineResponseState>
    implements _$$_PolylineResponseStateCopyWith<$Res> {
  __$$_PolylineResponseStateCopyWithImpl(_$_PolylineResponseState _value,
      $Res Function(_$_PolylineResponseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bounds = freezed,
    Object? distance = null,
    Object? duration = null,
    Object? polylinePoints = null,
    Object? southwestLat = freezed,
    Object? southwestLng = freezed,
    Object? northeastLat = freezed,
    Object? northeastLng = freezed,
  }) {
    return _then(_$_PolylineResponseState(
      bounds: freezed == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as LatLngBounds?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      polylinePoints: null == polylinePoints
          ? _value._polylinePoints
          : polylinePoints // ignore: cast_nullable_to_non_nullable
              as List<PointLatLng>,
      southwestLat:
          freezed == southwestLat ? _value.southwestLat! : southwestLat,
      southwestLng:
          freezed == southwestLng ? _value.southwestLng! : southwestLng,
      northeastLat:
          freezed == northeastLat ? _value.northeastLat! : northeastLat,
      northeastLng:
          freezed == northeastLng ? _value.northeastLng! : northeastLng,
    ));
  }
}

/// @nodoc

class _$_PolylineResponseState implements _PolylineResponseState {
  const _$_PolylineResponseState(
      {this.bounds,
      this.distance = '',
      this.duration = '',
      final List<PointLatLng> polylinePoints = const [],
      this.southwestLat = 0,
      this.southwestLng = 0,
      this.northeastLat = 0,
      this.northeastLng = 0})
      : _polylinePoints = polylinePoints;

  @override
  final LatLngBounds? bounds;
  @override
  @JsonKey()
  final String distance;
  @override
  @JsonKey()
  final String duration;
  final List<PointLatLng> _polylinePoints;
  @override
  @JsonKey()
  List<PointLatLng> get polylinePoints {
    if (_polylinePoints is EqualUnmodifiableListView) return _polylinePoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polylinePoints);
  }

  @override
  @JsonKey()
  final dynamic southwestLat;
  @override
  @JsonKey()
  final dynamic southwestLng;
  @override
  @JsonKey()
  final dynamic northeastLat;
  @override
  @JsonKey()
  final dynamic northeastLng;

  @override
  String toString() {
    return 'PolylineResponseState(bounds: $bounds, distance: $distance, duration: $duration, polylinePoints: $polylinePoints, southwestLat: $southwestLat, southwestLng: $southwestLng, northeastLat: $northeastLat, northeastLng: $northeastLng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PolylineResponseState &&
            (identical(other.bounds, bounds) || other.bounds == bounds) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality()
                .equals(other._polylinePoints, _polylinePoints) &&
            const DeepCollectionEquality()
                .equals(other.southwestLat, southwestLat) &&
            const DeepCollectionEquality()
                .equals(other.southwestLng, southwestLng) &&
            const DeepCollectionEquality()
                .equals(other.northeastLat, northeastLat) &&
            const DeepCollectionEquality()
                .equals(other.northeastLng, northeastLng));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      bounds,
      distance,
      duration,
      const DeepCollectionEquality().hash(_polylinePoints),
      const DeepCollectionEquality().hash(southwestLat),
      const DeepCollectionEquality().hash(southwestLng),
      const DeepCollectionEquality().hash(northeastLat),
      const DeepCollectionEquality().hash(northeastLng));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PolylineResponseStateCopyWith<_$_PolylineResponseState> get copyWith =>
      __$$_PolylineResponseStateCopyWithImpl<_$_PolylineResponseState>(
          this, _$identity);
}

abstract class _PolylineResponseState implements PolylineResponseState {
  const factory _PolylineResponseState(
      {final LatLngBounds? bounds,
      final String distance,
      final String duration,
      final List<PointLatLng> polylinePoints,
      final dynamic southwestLat,
      final dynamic southwestLng,
      final dynamic northeastLat,
      final dynamic northeastLng}) = _$_PolylineResponseState;

  @override
  LatLngBounds? get bounds;
  @override
  String get distance;
  @override
  String get duration;
  @override
  List<PointLatLng> get polylinePoints;
  @override
  dynamic get southwestLat;
  @override
  dynamic get southwestLng;
  @override
  dynamic get northeastLat;
  @override
  dynamic get northeastLng;
  @override
  @JsonKey(ignore: true)
  _$$_PolylineResponseStateCopyWith<_$_PolylineResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}
