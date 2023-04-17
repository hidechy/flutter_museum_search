// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prefecture_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PrefectureState {
//
  List<PrefectureData> get prefList => throw _privateConstructorUsedError; //
  int get selectPrefCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PrefectureStateCopyWith<PrefectureState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrefectureStateCopyWith<$Res> {
  factory $PrefectureStateCopyWith(
          PrefectureState value, $Res Function(PrefectureState) then) =
      _$PrefectureStateCopyWithImpl<$Res, PrefectureState>;

  @useResult
  $Res call({List<PrefectureData> prefList, int selectPrefCode});
}

/// @nodoc
class _$PrefectureStateCopyWithImpl<$Res, $Val extends PrefectureState>
    implements $PrefectureStateCopyWith<$Res> {
  _$PrefectureStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prefList = null,
    Object? selectPrefCode = null,
  }) {
    return _then(_value.copyWith(
      prefList: null == prefList
          ? _value.prefList
          : prefList // ignore: cast_nullable_to_non_nullable
              as List<PrefectureData>,
      selectPrefCode: null == selectPrefCode
          ? _value.selectPrefCode
          : selectPrefCode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrefectureStateCopyWith<$Res>
    implements $PrefectureStateCopyWith<$Res> {
  factory _$$_PrefectureStateCopyWith(
          _$_PrefectureState value, $Res Function(_$_PrefectureState) then) =
      __$$_PrefectureStateCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({List<PrefectureData> prefList, int selectPrefCode});
}

/// @nodoc
class __$$_PrefectureStateCopyWithImpl<$Res>
    extends _$PrefectureStateCopyWithImpl<$Res, _$_PrefectureState>
    implements _$$_PrefectureStateCopyWith<$Res> {
  __$$_PrefectureStateCopyWithImpl(
      _$_PrefectureState _value, $Res Function(_$_PrefectureState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prefList = null,
    Object? selectPrefCode = null,
  }) {
    return _then(_$_PrefectureState(
      prefList: null == prefList
          ? _value._prefList
          : prefList // ignore: cast_nullable_to_non_nullable
              as List<PrefectureData>,
      selectPrefCode: null == selectPrefCode
          ? _value.selectPrefCode
          : selectPrefCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PrefectureState implements _PrefectureState {
  const _$_PrefectureState(
      {final List<PrefectureData> prefList = const [], this.selectPrefCode = 0})
      : _prefList = prefList;

//
  final List<PrefectureData> _prefList;

//
  @override
  @JsonKey()
  List<PrefectureData> get prefList {
    if (_prefList is EqualUnmodifiableListView) return _prefList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prefList);
  }

//
  @override
  @JsonKey()
  final int selectPrefCode;

  @override
  String toString() {
    return 'PrefectureState(prefList: $prefList, selectPrefCode: $selectPrefCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrefectureState &&
            const DeepCollectionEquality().equals(other._prefList, _prefList) &&
            (identical(other.selectPrefCode, selectPrefCode) ||
                other.selectPrefCode == selectPrefCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_prefList), selectPrefCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrefectureStateCopyWith<_$_PrefectureState> get copyWith =>
      __$$_PrefectureStateCopyWithImpl<_$_PrefectureState>(this, _$identity);
}

abstract class _PrefectureState implements PrefectureState {
  const factory _PrefectureState(
      {final List<PrefectureData> prefList,
      final int selectPrefCode}) = _$_PrefectureState;

  @override //
  List<PrefectureData> get prefList;

  @override //
  int get selectPrefCode;

  @override
  @JsonKey(ignore: true)
  _$$_PrefectureStateCopyWith<_$_PrefectureState> get copyWith =>
      throw _privateConstructorUsedError;
}
