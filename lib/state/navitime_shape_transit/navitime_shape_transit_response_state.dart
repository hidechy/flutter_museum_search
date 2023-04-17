import 'package:freezed_annotation/freezed_annotation.dart';

part 'navitime_shape_transit_response_state.freezed.dart';

@freezed
class NavitimeShapeTransitResponseState
    with _$NavitimeShapeTransitResponseState {
  const factory NavitimeShapeTransitResponseState({
    @Default([]) list,
  }) = _NavitimeShapeTransitResponseState;
}

@freezed
class NavitimeShapeTransitResponseItemState
    with _$NavitimeShapeTransitResponseItemState {
  const factory NavitimeShapeTransitResponseItemState({
    //
    @Default('') String latitude,

    //
    @Default('') String longitude,
  }) = _NavitimeShapeTransitResponseItemState;
}
