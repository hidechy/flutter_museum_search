// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_param_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppParamState {
//
  bool get searchDisp => throw _privateConstructorUsedError; //
  bool get searchFlag => throw _privateConstructorUsedError; //
  bool get searchErrorFlag => throw _privateConstructorUsedError;
  String get searchErrorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppParamStateCopyWith<AppParamState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppParamStateCopyWith<$Res> {
  factory $AppParamStateCopyWith(
          AppParamState value, $Res Function(AppParamState) then) =
      _$AppParamStateCopyWithImpl<$Res, AppParamState>;
  @useResult
  $Res call(
      {bool searchDisp,
      bool searchFlag,
      bool searchErrorFlag,
      String searchErrorMessage});
}

/// @nodoc
class _$AppParamStateCopyWithImpl<$Res, $Val extends AppParamState>
    implements $AppParamStateCopyWith<$Res> {
  _$AppParamStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchDisp = null,
    Object? searchFlag = null,
    Object? searchErrorFlag = null,
    Object? searchErrorMessage = null,
  }) {
    return _then(_value.copyWith(
      searchDisp: null == searchDisp
          ? _value.searchDisp
          : searchDisp // ignore: cast_nullable_to_non_nullable
              as bool,
      searchFlag: null == searchFlag
          ? _value.searchFlag
          : searchFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      searchErrorFlag: null == searchErrorFlag
          ? _value.searchErrorFlag
          : searchErrorFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      searchErrorMessage: null == searchErrorMessage
          ? _value.searchErrorMessage
          : searchErrorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppParamStateCopyWith<$Res>
    implements $AppParamStateCopyWith<$Res> {
  factory _$$_AppParamStateCopyWith(
          _$_AppParamState value, $Res Function(_$_AppParamState) then) =
      __$$_AppParamStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool searchDisp,
      bool searchFlag,
      bool searchErrorFlag,
      String searchErrorMessage});
}

/// @nodoc
class __$$_AppParamStateCopyWithImpl<$Res>
    extends _$AppParamStateCopyWithImpl<$Res, _$_AppParamState>
    implements _$$_AppParamStateCopyWith<$Res> {
  __$$_AppParamStateCopyWithImpl(
      _$_AppParamState _value, $Res Function(_$_AppParamState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchDisp = null,
    Object? searchFlag = null,
    Object? searchErrorFlag = null,
    Object? searchErrorMessage = null,
  }) {
    return _then(_$_AppParamState(
      searchDisp: null == searchDisp
          ? _value.searchDisp
          : searchDisp // ignore: cast_nullable_to_non_nullable
              as bool,
      searchFlag: null == searchFlag
          ? _value.searchFlag
          : searchFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      searchErrorFlag: null == searchErrorFlag
          ? _value.searchErrorFlag
          : searchErrorFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      searchErrorMessage: null == searchErrorMessage
          ? _value.searchErrorMessage
          : searchErrorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppParamState implements _AppParamState {
  const _$_AppParamState(
      {this.searchDisp = false,
      this.searchFlag = false,
      this.searchErrorFlag = false,
      this.searchErrorMessage = ''});

//
  @override
  @JsonKey()
  final bool searchDisp;
//
  @override
  @JsonKey()
  final bool searchFlag;
//
  @override
  @JsonKey()
  final bool searchErrorFlag;
  @override
  @JsonKey()
  final String searchErrorMessage;

  @override
  String toString() {
    return 'AppParamState(searchDisp: $searchDisp, searchFlag: $searchFlag, searchErrorFlag: $searchErrorFlag, searchErrorMessage: $searchErrorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppParamState &&
            (identical(other.searchDisp, searchDisp) ||
                other.searchDisp == searchDisp) &&
            (identical(other.searchFlag, searchFlag) ||
                other.searchFlag == searchFlag) &&
            (identical(other.searchErrorFlag, searchErrorFlag) ||
                other.searchErrorFlag == searchErrorFlag) &&
            (identical(other.searchErrorMessage, searchErrorMessage) ||
                other.searchErrorMessage == searchErrorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, searchDisp, searchFlag, searchErrorFlag, searchErrorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppParamStateCopyWith<_$_AppParamState> get copyWith =>
      __$$_AppParamStateCopyWithImpl<_$_AppParamState>(this, _$identity);
}

abstract class _AppParamState implements AppParamState {
  const factory _AppParamState(
      {final bool searchDisp,
      final bool searchFlag,
      final bool searchErrorFlag,
      final String searchErrorMessage}) = _$_AppParamState;

  @override //
  bool get searchDisp;
  @override //
  bool get searchFlag;
  @override //
  bool get searchErrorFlag;
  @override
  String get searchErrorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AppParamStateCopyWith<_$_AppParamState> get copyWith =>
      throw _privateConstructorUsedError;
}
