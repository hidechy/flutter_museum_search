// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_transit_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RouteTransitRequestState {
//
  String get start => throw _privateConstructorUsedError; //
  String get goal => throw _privateConstructorUsedError; //
  String get startTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouteTransitRequestStateCopyWith<RouteTransitRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteTransitRequestStateCopyWith<$Res> {
  factory $RouteTransitRequestStateCopyWith(RouteTransitRequestState value,
          $Res Function(RouteTransitRequestState) then) =
      _$RouteTransitRequestStateCopyWithImpl<$Res, RouteTransitRequestState>;
  @useResult
  $Res call({String start, String goal, String startTime});
}

/// @nodoc
class _$RouteTransitRequestStateCopyWithImpl<$Res,
        $Val extends RouteTransitRequestState>
    implements $RouteTransitRequestStateCopyWith<$Res> {
  _$RouteTransitRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? goal = null,
    Object? startTime = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RouteTransitRequestStateCopyWith<$Res>
    implements $RouteTransitRequestStateCopyWith<$Res> {
  factory _$$_RouteTransitRequestStateCopyWith(
          _$_RouteTransitRequestState value,
          $Res Function(_$_RouteTransitRequestState) then) =
      __$$_RouteTransitRequestStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String start, String goal, String startTime});
}

/// @nodoc
class __$$_RouteTransitRequestStateCopyWithImpl<$Res>
    extends _$RouteTransitRequestStateCopyWithImpl<$Res,
        _$_RouteTransitRequestState>
    implements _$$_RouteTransitRequestStateCopyWith<$Res> {
  __$$_RouteTransitRequestStateCopyWithImpl(_$_RouteTransitRequestState _value,
      $Res Function(_$_RouteTransitRequestState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? goal = null,
    Object? startTime = null,
  }) {
    return _then(_$_RouteTransitRequestState(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RouteTransitRequestState implements _RouteTransitRequestState {
  const _$_RouteTransitRequestState(
      {this.start = '', this.goal = '', this.startTime = ''});

//
  @override
  @JsonKey()
  final String start;
//
  @override
  @JsonKey()
  final String goal;
//
  @override
  @JsonKey()
  final String startTime;

  @override
  String toString() {
    return 'RouteTransitRequestState(start: $start, goal: $goal, startTime: $startTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RouteTransitRequestState &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, goal, startTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RouteTransitRequestStateCopyWith<_$_RouteTransitRequestState>
      get copyWith => __$$_RouteTransitRequestStateCopyWithImpl<
          _$_RouteTransitRequestState>(this, _$identity);
}

abstract class _RouteTransitRequestState implements RouteTransitRequestState {
  const factory _RouteTransitRequestState(
      {final String start,
      final String goal,
      final String startTime}) = _$_RouteTransitRequestState;

  @override //
  String get start;
  @override //
  String get goal;
  @override //
  String get startTime;
  @override
  @JsonKey(ignore: true)
  _$$_RouteTransitRequestStateCopyWith<_$_RouteTransitRequestState>
      get copyWith => throw _privateConstructorUsedError;
}
