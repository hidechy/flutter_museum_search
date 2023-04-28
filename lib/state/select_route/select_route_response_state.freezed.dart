// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_route_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectRouteResponseState {
  ///
  List<String> get selectedIds => throw _privateConstructorUsedError; //
  bool get startNow => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError; //
  int get walkSpeed => throw _privateConstructorUsedError; //
  bool get startGoalBothSelect => throw _privateConstructorUsedError; //
  int get spotStayTime => throw _privateConstructorUsedError; //
  int get adjustPercent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectRouteResponseStateCopyWith<SelectRouteResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectRouteResponseStateCopyWith<$Res> {
  factory $SelectRouteResponseStateCopyWith(SelectRouteResponseState value,
          $Res Function(SelectRouteResponseState) then) =
      _$SelectRouteResponseStateCopyWithImpl<$Res, SelectRouteResponseState>;
  @useResult
  $Res call(
      {List<String> selectedIds,
      bool startNow,
      String startTime,
      int walkSpeed,
      bool startGoalBothSelect,
      int spotStayTime,
      int adjustPercent});
}

/// @nodoc
class _$SelectRouteResponseStateCopyWithImpl<$Res,
        $Val extends SelectRouteResponseState>
    implements $SelectRouteResponseStateCopyWith<$Res> {
  _$SelectRouteResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIds = null,
    Object? startNow = null,
    Object? startTime = null,
    Object? walkSpeed = null,
    Object? startGoalBothSelect = null,
    Object? spotStayTime = null,
    Object? adjustPercent = null,
  }) {
    return _then(_value.copyWith(
      selectedIds: null == selectedIds
          ? _value.selectedIds
          : selectedIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      startNow: null == startNow
          ? _value.startNow
          : startNow // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      walkSpeed: null == walkSpeed
          ? _value.walkSpeed
          : walkSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      startGoalBothSelect: null == startGoalBothSelect
          ? _value.startGoalBothSelect
          : startGoalBothSelect // ignore: cast_nullable_to_non_nullable
              as bool,
      spotStayTime: null == spotStayTime
          ? _value.spotStayTime
          : spotStayTime // ignore: cast_nullable_to_non_nullable
              as int,
      adjustPercent: null == adjustPercent
          ? _value.adjustPercent
          : adjustPercent // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectRouteResponseStateCopyWith<$Res>
    implements $SelectRouteResponseStateCopyWith<$Res> {
  factory _$$_SelectRouteResponseStateCopyWith(
          _$_SelectRouteResponseState value,
          $Res Function(_$_SelectRouteResponseState) then) =
      __$$_SelectRouteResponseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> selectedIds,
      bool startNow,
      String startTime,
      int walkSpeed,
      bool startGoalBothSelect,
      int spotStayTime,
      int adjustPercent});
}

/// @nodoc
class __$$_SelectRouteResponseStateCopyWithImpl<$Res>
    extends _$SelectRouteResponseStateCopyWithImpl<$Res,
        _$_SelectRouteResponseState>
    implements _$$_SelectRouteResponseStateCopyWith<$Res> {
  __$$_SelectRouteResponseStateCopyWithImpl(_$_SelectRouteResponseState _value,
      $Res Function(_$_SelectRouteResponseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIds = null,
    Object? startNow = null,
    Object? startTime = null,
    Object? walkSpeed = null,
    Object? startGoalBothSelect = null,
    Object? spotStayTime = null,
    Object? adjustPercent = null,
  }) {
    return _then(_$_SelectRouteResponseState(
      selectedIds: null == selectedIds
          ? _value._selectedIds
          : selectedIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      startNow: null == startNow
          ? _value.startNow
          : startNow // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      walkSpeed: null == walkSpeed
          ? _value.walkSpeed
          : walkSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      startGoalBothSelect: null == startGoalBothSelect
          ? _value.startGoalBothSelect
          : startGoalBothSelect // ignore: cast_nullable_to_non_nullable
              as bool,
      spotStayTime: null == spotStayTime
          ? _value.spotStayTime
          : spotStayTime // ignore: cast_nullable_to_non_nullable
              as int,
      adjustPercent: null == adjustPercent
          ? _value.adjustPercent
          : adjustPercent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SelectRouteResponseState implements _SelectRouteResponseState {
  const _$_SelectRouteResponseState(
      {final List<String> selectedIds = const [],
      this.startNow = true,
      this.startTime = '',
      this.walkSpeed = 5,
      this.startGoalBothSelect = false,
      this.spotStayTime = 20,
      this.adjustPercent = 20})
      : _selectedIds = selectedIds;

  ///
  final List<String> _selectedIds;

  ///
  @override
  @JsonKey()
  List<String> get selectedIds {
    if (_selectedIds is EqualUnmodifiableListView) return _selectedIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedIds);
  }

//
  @override
  @JsonKey()
  final bool startNow;
  @override
  @JsonKey()
  final String startTime;
//
  @override
  @JsonKey()
  final int walkSpeed;
//
  @override
  @JsonKey()
  final bool startGoalBothSelect;
//
  @override
  @JsonKey()
  final int spotStayTime;
//
  @override
  @JsonKey()
  final int adjustPercent;

  @override
  String toString() {
    return 'SelectRouteResponseState(selectedIds: $selectedIds, startNow: $startNow, startTime: $startTime, walkSpeed: $walkSpeed, startGoalBothSelect: $startGoalBothSelect, spotStayTime: $spotStayTime, adjustPercent: $adjustPercent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectRouteResponseState &&
            const DeepCollectionEquality()
                .equals(other._selectedIds, _selectedIds) &&
            (identical(other.startNow, startNow) ||
                other.startNow == startNow) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.walkSpeed, walkSpeed) ||
                other.walkSpeed == walkSpeed) &&
            (identical(other.startGoalBothSelect, startGoalBothSelect) ||
                other.startGoalBothSelect == startGoalBothSelect) &&
            (identical(other.spotStayTime, spotStayTime) ||
                other.spotStayTime == spotStayTime) &&
            (identical(other.adjustPercent, adjustPercent) ||
                other.adjustPercent == adjustPercent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedIds),
      startNow,
      startTime,
      walkSpeed,
      startGoalBothSelect,
      spotStayTime,
      adjustPercent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectRouteResponseStateCopyWith<_$_SelectRouteResponseState>
      get copyWith => __$$_SelectRouteResponseStateCopyWithImpl<
          _$_SelectRouteResponseState>(this, _$identity);
}

abstract class _SelectRouteResponseState implements SelectRouteResponseState {
  const factory _SelectRouteResponseState(
      {final List<String> selectedIds,
      final bool startNow,
      final String startTime,
      final int walkSpeed,
      final bool startGoalBothSelect,
      final int spotStayTime,
      final int adjustPercent}) = _$_SelectRouteResponseState;

  @override

  ///
  List<String> get selectedIds;
  @override //
  bool get startNow;
  @override
  String get startTime;
  @override //
  int get walkSpeed;
  @override //
  bool get startGoalBothSelect;
  @override //
  int get spotStayTime;
  @override //
  int get adjustPercent;
  @override
  @JsonKey(ignore: true)
  _$$_SelectRouteResponseStateCopyWith<_$_SelectRouteResponseState>
      get copyWith => throw _privateConstructorUsedError;
}
