import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_param_state.freezed.dart';

@freezed
class AppParamState with _$AppParamState {
  const factory AppParamState({
    //
    @Default(false) bool searchDisp,

    //
    @Default(false) bool searchErrorFlag,
    @Default('') String searchErrorMessage,

    //
    @Default('') String selectedRouteNumber,

    //
    @Default(1) baseInclude,
  }) = _AppParamState;
}
