import 'package:freezed_annotation/freezed_annotation.dart';

part 'navitime_shape_transit_request_state.freezed.dart';

@freezed
class NavitimeShapeTransitRequestState with _$NavitimeShapeTransitRequestState {
  const factory NavitimeShapeTransitRequestState({
    //
    @Default(false) bool interlocking,

    //
    @Default('') String start,

    //
    @Default('') String goal,

    //
    @Default('') String startTime,
  }) = _NavitimeShapeTransitRequestState;
}
