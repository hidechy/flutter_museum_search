import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_transit_request_state.freezed.dart';

@freezed
class RouteTransitRequestState with _$RouteTransitRequestState {
  const factory RouteTransitRequestState({
    @Default('') String start,
    @Default('') String goal,
    @Default('') String startTime,
  }) = _RouteTransitRequestState;
}
