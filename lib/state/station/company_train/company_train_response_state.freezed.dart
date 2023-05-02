// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_train_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CompanyTrainResponseState {
//
  List<Company> get companyTrainList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompanyTrainResponseStateCopyWith<CompanyTrainResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyTrainResponseStateCopyWith<$Res> {
  factory $CompanyTrainResponseStateCopyWith(CompanyTrainResponseState value,
          $Res Function(CompanyTrainResponseState) then) =
      _$CompanyTrainResponseStateCopyWithImpl<$Res, CompanyTrainResponseState>;
  @useResult
  $Res call({List<Company> companyTrainList});
}

/// @nodoc
class _$CompanyTrainResponseStateCopyWithImpl<$Res,
        $Val extends CompanyTrainResponseState>
    implements $CompanyTrainResponseStateCopyWith<$Res> {
  _$CompanyTrainResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyTrainList = null,
  }) {
    return _then(_value.copyWith(
      companyTrainList: null == companyTrainList
          ? _value.companyTrainList
          : companyTrainList // ignore: cast_nullable_to_non_nullable
              as List<Company>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompanyTrainResponseStateCopyWith<$Res>
    implements $CompanyTrainResponseStateCopyWith<$Res> {
  factory _$$_CompanyTrainResponseStateCopyWith(
          _$_CompanyTrainResponseState value,
          $Res Function(_$_CompanyTrainResponseState) then) =
      __$$_CompanyTrainResponseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Company> companyTrainList});
}

/// @nodoc
class __$$_CompanyTrainResponseStateCopyWithImpl<$Res>
    extends _$CompanyTrainResponseStateCopyWithImpl<$Res,
        _$_CompanyTrainResponseState>
    implements _$$_CompanyTrainResponseStateCopyWith<$Res> {
  __$$_CompanyTrainResponseStateCopyWithImpl(
      _$_CompanyTrainResponseState _value,
      $Res Function(_$_CompanyTrainResponseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyTrainList = null,
  }) {
    return _then(_$_CompanyTrainResponseState(
      companyTrainList: null == companyTrainList
          ? _value._companyTrainList
          : companyTrainList // ignore: cast_nullable_to_non_nullable
              as List<Company>,
    ));
  }
}

/// @nodoc

class _$_CompanyTrainResponseState implements _CompanyTrainResponseState {
  const _$_CompanyTrainResponseState(
      {final List<Company> companyTrainList = const []})
      : _companyTrainList = companyTrainList;

//
  final List<Company> _companyTrainList;
//
  @override
  @JsonKey()
  List<Company> get companyTrainList {
    if (_companyTrainList is EqualUnmodifiableListView)
      return _companyTrainList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_companyTrainList);
  }

  @override
  String toString() {
    return 'CompanyTrainResponseState(companyTrainList: $companyTrainList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompanyTrainResponseState &&
            const DeepCollectionEquality()
                .equals(other._companyTrainList, _companyTrainList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_companyTrainList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompanyTrainResponseStateCopyWith<_$_CompanyTrainResponseState>
      get copyWith => __$$_CompanyTrainResponseStateCopyWithImpl<
          _$_CompanyTrainResponseState>(this, _$identity);
}

abstract class _CompanyTrainResponseState implements CompanyTrainResponseState {
  const factory _CompanyTrainResponseState(
      {final List<Company> companyTrainList}) = _$_CompanyTrainResponseState;

  @override //
  List<Company> get companyTrainList;
  @override
  @JsonKey(ignore: true)
  _$$_CompanyTrainResponseStateCopyWith<_$_CompanyTrainResponseState>
      get copyWith => throw _privateConstructorUsedError;
}
