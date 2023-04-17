import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_transit_response_state.freezed.dart';

@freezed
class RouteTransitState with _$RouteTransitState {
  const factory RouteTransitState({
    @Default([]) list,
  }) = _RouteTransitState;
}

@freezed
class RouteTransitResponseItemState with _$RouteTransitResponseItemState {
  const factory RouteTransitResponseItemState({
    //
    @Default('') String latitude,

    //
    @Default('') String longitude,
  }) = _RouteTransitResponseItemState;
}
