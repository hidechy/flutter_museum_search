// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_marker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapMarkerState {
//
  Set<Marker> get markers => throw _privateConstructorUsedError; //
  String get selectName => throw _privateConstructorUsedError; //
  List<BitmapDescriptor> get numbersList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapMarkerStateCopyWith<MapMarkerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapMarkerStateCopyWith<$Res> {
  factory $MapMarkerStateCopyWith(
          MapMarkerState value, $Res Function(MapMarkerState) then) =
      _$MapMarkerStateCopyWithImpl<$Res, MapMarkerState>;
  @useResult
  $Res call(
      {Set<Marker> markers,
      String selectName,
      List<BitmapDescriptor> numbersList});
}

/// @nodoc
class _$MapMarkerStateCopyWithImpl<$Res, $Val extends MapMarkerState>
    implements $MapMarkerStateCopyWith<$Res> {
  _$MapMarkerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
    Object? selectName = null,
    Object? numbersList = null,
  }) {
    return _then(_value.copyWith(
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      selectName: null == selectName
          ? _value.selectName
          : selectName // ignore: cast_nullable_to_non_nullable
              as String,
      numbersList: null == numbersList
          ? _value.numbersList
          : numbersList // ignore: cast_nullable_to_non_nullable
              as List<BitmapDescriptor>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MapMarkerStateCopyWith<$Res>
    implements $MapMarkerStateCopyWith<$Res> {
  factory _$$_MapMarkerStateCopyWith(
          _$_MapMarkerState value, $Res Function(_$_MapMarkerState) then) =
      __$$_MapMarkerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Set<Marker> markers,
      String selectName,
      List<BitmapDescriptor> numbersList});
}

/// @nodoc
class __$$_MapMarkerStateCopyWithImpl<$Res>
    extends _$MapMarkerStateCopyWithImpl<$Res, _$_MapMarkerState>
    implements _$$_MapMarkerStateCopyWith<$Res> {
  __$$_MapMarkerStateCopyWithImpl(
      _$_MapMarkerState _value, $Res Function(_$_MapMarkerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
    Object? selectName = null,
    Object? numbersList = null,
  }) {
    return _then(_$_MapMarkerState(
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      selectName: null == selectName
          ? _value.selectName
          : selectName // ignore: cast_nullable_to_non_nullable
              as String,
      numbersList: null == numbersList
          ? _value._numbersList
          : numbersList // ignore: cast_nullable_to_non_nullable
              as List<BitmapDescriptor>,
    ));
  }
}

/// @nodoc

class _$_MapMarkerState implements _MapMarkerState {
  const _$_MapMarkerState(
      {final Set<Marker> markers = const {},
      this.selectName = '',
      final List<BitmapDescriptor> numbersList = const []})
      : _markers = markers,
        _numbersList = numbersList;

//
  final Set<Marker> _markers;
//
  @override
  @JsonKey()
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

//
  @override
  @JsonKey()
  final String selectName;
//
  final List<BitmapDescriptor> _numbersList;
//
  @override
  @JsonKey()
  List<BitmapDescriptor> get numbersList {
    if (_numbersList is EqualUnmodifiableListView) return _numbersList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbersList);
  }

  @override
  String toString() {
    return 'MapMarkerState(markers: $markers, selectName: $selectName, numbersList: $numbersList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapMarkerState &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.selectName, selectName) ||
                other.selectName == selectName) &&
            const DeepCollectionEquality()
                .equals(other._numbersList, _numbersList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_markers),
      selectName,
      const DeepCollectionEquality().hash(_numbersList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapMarkerStateCopyWith<_$_MapMarkerState> get copyWith =>
      __$$_MapMarkerStateCopyWithImpl<_$_MapMarkerState>(this, _$identity);
}

abstract class _MapMarkerState implements MapMarkerState {
  const factory _MapMarkerState(
      {final Set<Marker> markers,
      final String selectName,
      final List<BitmapDescriptor> numbersList}) = _$_MapMarkerState;

  @override //
  Set<Marker> get markers;
  @override //
  String get selectName;
  @override //
  List<BitmapDescriptor> get numbersList;
  @override
  @JsonKey(ignore: true)
  _$$_MapMarkerStateCopyWith<_$_MapMarkerState> get copyWith =>
      throw _privateConstructorUsedError;
}
