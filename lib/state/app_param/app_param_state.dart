import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_param_state.freezed.dart';

@freezed
class AppParamState with _$AppParamState {
  const factory AppParamState({
    @Default(false) bool citySelectFlag,
    @Default(false) bool searchDisp,
    @Default(false) bool searchFlag,
  }) = _AppParamState;
}
