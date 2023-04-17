// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CityState {
//
  List<CityData> get cityList => throw _privateConstructorUsedError; //
  String get selectCityCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CityStateCopyWith<CityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityStateCopyWith<$Res> {
  factory $CityStateCopyWith(CityState value, $Res Function(CityState) then) =
      _$CityStateCopyWithImpl<$Res, CityState>;
  @useResult
  $Res call({List<CityData> cityList, String selectCityCode});
}

/// @nodoc
class _$CityStateCopyWithImpl<$Res, $Val extends CityState>
    implements $CityStateCopyWith<$Res> {
  _$CityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityList = null,
    Object? selectCityCode = null,
  }) {
    return _then(_value.copyWith(
      cityList: null == cityList
          ? _value.cityList
          : cityList // ignore: cast_nullable_to_non_nullable
              as List<CityData>,
      selectCityCode: null == selectCityCode
          ? _value.selectCityCode
          : selectCityCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CityStateCopyWith<$Res> implements $CityStateCopyWith<$Res> {
  factory _$$_CityStateCopyWith(
          _$_CityState value, $Res Function(_$_CityState) then) =
      __$$_CityStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CityData> cityList, String selectCityCode});
}

/// @nodoc
class __$$_CityStateCopyWithImpl<$Res>
    extends _$CityStateCopyWithImpl<$Res, _$_CityState>
    implements _$$_CityStateCopyWith<$Res> {
  __$$_CityStateCopyWithImpl(
      _$_CityState _value, $Res Function(_$_CityState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityList = null,
    Object? selectCityCode = null,
  }) {
    return _then(_$_CityState(
      cityList: null == cityList
          ? _value._cityList
          : cityList // ignore: cast_nullable_to_non_nullable
              as List<CityData>,
      selectCityCode: null == selectCityCode
          ? _value.selectCityCode
          : selectCityCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CityState implements _CityState {
  const _$_CityState(
      {final List<CityData> cityList = const [], this.selectCityCode = ''})
      : _cityList = cityList;

//
  final List<CityData> _cityList;
//
  @override
  @JsonKey()
  List<CityData> get cityList {
    if (_cityList is EqualUnmodifiableListView) return _cityList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cityList);
  }

//
  @override
  @JsonKey()
  final String selectCityCode;

  @override
  String toString() {
    return 'CityState(cityList: $cityList, selectCityCode: $selectCityCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CityState &&
            const DeepCollectionEquality().equals(other._cityList, _cityList) &&
            (identical(other.selectCityCode, selectCityCode) ||
                other.selectCityCode == selectCityCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_cityList), selectCityCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CityStateCopyWith<_$_CityState> get copyWith =>
      __$$_CityStateCopyWithImpl<_$_CityState>(this, _$identity);
}

abstract class _CityState implements CityState {
  const factory _CityState(
      {final List<CityData> cityList,
      final String selectCityCode}) = _$_CityState;

  @override //
  List<CityData> get cityList;
  @override //
  String get selectCityCode;
  @override
  @JsonKey(ignore: true)
  _$$_CityStateCopyWith<_$_CityState> get copyWith =>
      throw _privateConstructorUsedError;
}
