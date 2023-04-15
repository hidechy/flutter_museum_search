import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/prefecture.dart';

part 'prefecture_state.freezed.dart';

@freezed
class PrefectureState with _$PrefectureState {
  const factory PrefectureState({
    @Default([]) List<Pref> prefList,
    @Default('') String selectPref,
  }) = _PrefectureState;
}
