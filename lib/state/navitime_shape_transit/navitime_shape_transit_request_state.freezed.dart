// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navitime_shape_transit_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavitimeShapeTransitRequestState {
//
  String get start => throw _privateConstructorUsedError; //
  String get goal => throw _privateConstructorUsedError; //
  String get startTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavitimeShapeTransitRequestStateCopyWith<NavitimeShapeTransitRequestState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavitimeShapeTransitRequestStateCopyWith<$Res> {
  factory $NavitimeShapeTransitRequestStateCopyWith(
          NavitimeShapeTransitRequestState value,
          $Res Function(NavitimeShapeTransitRequestState) then) =
      _$NavitimeShapeTransitRequestStateCopyWithImpl<$Res,
          NavitimeShapeTransitRequestState>;
  @useResult
  $Res call({String start, String goal, String startTime});
}

/// @nodoc
class _$NavitimeShapeTransitRequestStateCopyWithImpl<$Res,
        $Val extends NavitimeShapeTransitRequestState>
    implements $NavitimeShapeTransitRequestStateCopyWith<$Res> {
  _$NavitimeShapeTransitRequestStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_NavitimeShapeTransitRequestStateCopyWith<$Res>
    implements $NavitimeShapeTransitRequestStateCopyWith<$Res> {
  factory _$$_NavitimeShapeTransitRequestStateCopyWith(
          _$_NavitimeShapeTransitRequestState value,
          $Res Function(_$_NavitimeShapeTransitRequestState) then) =
      __$$_NavitimeShapeTransitRequestStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String start, String goal, String startTime});
}

/// @nodoc
class __$$_NavitimeShapeTransitRequestStateCopyWithImpl<$Res>
    extends _$NavitimeShapeTransitRequestStateCopyWithImpl<$Res,
        _$_NavitimeShapeTransitRequestState>
    implements _$$_NavitimeShapeTransitRequestStateCopyWith<$Res> {
  __$$_NavitimeShapeTransitRequestStateCopyWithImpl(
      _$_NavitimeShapeTransitRequestState _value,
      $Res Function(_$_NavitimeShapeTransitRequestState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? goal = null,
    Object? startTime = null,
  }) {
    return _then(_$_NavitimeShapeTransitRequestState(
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

class _$_NavitimeShapeTransitRequestState
    implements _NavitimeShapeTransitRequestState {
  const _$_NavitimeShapeTransitRequestState(
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
    return 'NavitimeShapeTransitRequestState(start: $start, goal: $goal, startTime: $startTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavitimeShapeTransitRequestState &&
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
  _$$_NavitimeShapeTransitRequestStateCopyWith<
          _$_NavitimeShapeTransitRequestState>
      get copyWith => __$$_NavitimeShapeTransitRequestStateCopyWithImpl<
          _$_NavitimeShapeTransitRequestState>(this, _$identity);
}

abstract class _NavitimeShapeTransitRequestState
    implements NavitimeShapeTransitRequestState {
  const factory _NavitimeShapeTransitRequestState(
      {final String start,
      final String goal,
      final String startTime}) = _$_NavitimeShapeTransitRequestState;

  @override //
  String get start;
  @override //
  String get goal;
  @override //
  String get startTime;
  @override
  @JsonKey(ignore: true)
  _$$_NavitimeShapeTransitRequestStateCopyWith<
          _$_NavitimeShapeTransitRequestState>
      get copyWith => throw _privateConstructorUsedError;
}
