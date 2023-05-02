// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'train_station_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrainStationResponseState {
//
  List<Station> get trainStationList => throw _privateConstructorUsedError; //
  Map<int, Station> get trainStationMap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrainStationResponseStateCopyWith<TrainStationResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainStationResponseStateCopyWith<$Res> {
  factory $TrainStationResponseStateCopyWith(TrainStationResponseState value,
          $Res Function(TrainStationResponseState) then) =
      _$TrainStationResponseStateCopyWithImpl<$Res, TrainStationResponseState>;
  @useResult
  $Res call(
      {List<Station> trainStationList, Map<int, Station> trainStationMap});
}

/// @nodoc
class _$TrainStationResponseStateCopyWithImpl<$Res,
        $Val extends TrainStationResponseState>
    implements $TrainStationResponseStateCopyWith<$Res> {
  _$TrainStationResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainStationList = null,
    Object? trainStationMap = null,
  }) {
    return _then(_value.copyWith(
      trainStationList: null == trainStationList
          ? _value.trainStationList
          : trainStationList // ignore: cast_nullable_to_non_nullable
              as List<Station>,
      trainStationMap: null == trainStationMap
          ? _value.trainStationMap
          : trainStationMap // ignore: cast_nullable_to_non_nullable
              as Map<int, Station>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrainStationResponseStateCopyWith<$Res>
    implements $TrainStationResponseStateCopyWith<$Res> {
  factory _$$_TrainStationResponseStateCopyWith(
          _$_TrainStationResponseState value,
          $Res Function(_$_TrainStationResponseState) then) =
      __$$_TrainStationResponseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Station> trainStationList, Map<int, Station> trainStationMap});
}

/// @nodoc
class __$$_TrainStationResponseStateCopyWithImpl<$Res>
    extends _$TrainStationResponseStateCopyWithImpl<$Res,
        _$_TrainStationResponseState>
    implements _$$_TrainStationResponseStateCopyWith<$Res> {
  __$$_TrainStationResponseStateCopyWithImpl(
      _$_TrainStationResponseState _value,
      $Res Function(_$_TrainStationResponseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainStationList = null,
    Object? trainStationMap = null,
  }) {
    return _then(_$_TrainStationResponseState(
      trainStationList: null == trainStationList
          ? _value._trainStationList
          : trainStationList // ignore: cast_nullable_to_non_nullable
              as List<Station>,
      trainStationMap: null == trainStationMap
          ? _value._trainStationMap
          : trainStationMap // ignore: cast_nullable_to_non_nullable
              as Map<int, Station>,
    ));
  }
}

/// @nodoc

class _$_TrainStationResponseState implements _TrainStationResponseState {
  const _$_TrainStationResponseState(
      {final List<Station> trainStationList = const [],
      final Map<int, Station> trainStationMap = const {}})
      : _trainStationList = trainStationList,
        _trainStationMap = trainStationMap;

//
  final List<Station> _trainStationList;
//
  @override
  @JsonKey()
  List<Station> get trainStationList {
    if (_trainStationList is EqualUnmodifiableListView)
      return _trainStationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trainStationList);
  }

//
  final Map<int, Station> _trainStationMap;
//
  @override
  @JsonKey()
  Map<int, Station> get trainStationMap {
    if (_trainStationMap is EqualUnmodifiableMapView) return _trainStationMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_trainStationMap);
  }

  @override
  String toString() {
    return 'TrainStationResponseState(trainStationList: $trainStationList, trainStationMap: $trainStationMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrainStationResponseState &&
            const DeepCollectionEquality()
                .equals(other._trainStationList, _trainStationList) &&
            const DeepCollectionEquality()
                .equals(other._trainStationMap, _trainStationMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_trainStationList),
      const DeepCollectionEquality().hash(_trainStationMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrainStationResponseStateCopyWith<_$_TrainStationResponseState>
      get copyWith => __$$_TrainStationResponseStateCopyWithImpl<
          _$_TrainStationResponseState>(this, _$identity);
}

abstract class _TrainStationResponseState implements TrainStationResponseState {
  const factory _TrainStationResponseState(
      {final List<Station> trainStationList,
      final Map<int, Station> trainStationMap}) = _$_TrainStationResponseState;

  @override //
  List<Station> get trainStationList;
  @override //
  Map<int, Station> get trainStationMap;
  @override
  @JsonKey(ignore: true)
  _$$_TrainStationResponseStateCopyWith<_$_TrainStationResponseState>
      get copyWith => throw _privateConstructorUsedError;
}
