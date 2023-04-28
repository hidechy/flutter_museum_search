import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_route_response_state.freezed.dart';

@freezed
class SelectRouteResponseState with _$SelectRouteResponseState {
  const factory SelectRouteResponseState({
    ///
    @Default([]) List<String> selectedIds,

    //
    @Default(true) bool startNow,
    @Default('') String startTime,

    //
    @Default(5) int walkSpeed,

    //
    @Default(false) bool startGoalBothSelect,

    //
    @Default(20) int spotStayTime,

    //
    @Default(20) int adjustPercent,
  }) = _SelectRouteResponseState;
}
