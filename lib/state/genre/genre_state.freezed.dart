// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GenreState {
//
  List<String> get genreList => throw _privateConstructorUsedError; //
  String get selectGenre => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenreStateCopyWith<GenreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreStateCopyWith<$Res> {
  factory $GenreStateCopyWith(
          GenreState value, $Res Function(GenreState) then) =
      _$GenreStateCopyWithImpl<$Res, GenreState>;
  @useResult
  $Res call({List<String> genreList, String selectGenre});
}

/// @nodoc
class _$GenreStateCopyWithImpl<$Res, $Val extends GenreState>
    implements $GenreStateCopyWith<$Res> {
  _$GenreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genreList = null,
    Object? selectGenre = null,
  }) {
    return _then(_value.copyWith(
      genreList: null == genreList
          ? _value.genreList
          : genreList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectGenre: null == selectGenre
          ? _value.selectGenre
          : selectGenre // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenreStateCopyWith<$Res>
    implements $GenreStateCopyWith<$Res> {
  factory _$$_GenreStateCopyWith(
          _$_GenreState value, $Res Function(_$_GenreState) then) =
      __$$_GenreStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> genreList, String selectGenre});
}

/// @nodoc
class __$$_GenreStateCopyWithImpl<$Res>
    extends _$GenreStateCopyWithImpl<$Res, _$_GenreState>
    implements _$$_GenreStateCopyWith<$Res> {
  __$$_GenreStateCopyWithImpl(
      _$_GenreState _value, $Res Function(_$_GenreState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genreList = null,
    Object? selectGenre = null,
  }) {
    return _then(_$_GenreState(
      genreList: null == genreList
          ? _value._genreList
          : genreList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectGenre: null == selectGenre
          ? _value.selectGenre
          : selectGenre // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GenreState implements _GenreState {
  const _$_GenreState(
      {final List<String> genreList = const [], this.selectGenre = ''})
      : _genreList = genreList;

//
  final List<String> _genreList;
//
  @override
  @JsonKey()
  List<String> get genreList {
    if (_genreList is EqualUnmodifiableListView) return _genreList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genreList);
  }

//
  @override
  @JsonKey()
  final String selectGenre;

  @override
  String toString() {
    return 'GenreState(genreList: $genreList, selectGenre: $selectGenre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenreState &&
            const DeepCollectionEquality()
                .equals(other._genreList, _genreList) &&
            (identical(other.selectGenre, selectGenre) ||
                other.selectGenre == selectGenre));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_genreList), selectGenre);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenreStateCopyWith<_$_GenreState> get copyWith =>
      __$$_GenreStateCopyWithImpl<_$_GenreState>(this, _$identity);
}

abstract class _GenreState implements GenreState {
  const factory _GenreState(
      {final List<String> genreList, final String selectGenre}) = _$_GenreState;

  @override //
  List<String> get genreList;
  @override //
  String get selectGenre;
  @override
  @JsonKey(ignore: true)
  _$$_GenreStateCopyWith<_$_GenreState> get copyWith =>
      throw _privateConstructorUsedError;
}
