import 'package:freezed_annotation/freezed_annotation.dart';

part 'lat_lng_request_state.freezed.dart';

@freezed
class LatLngRequestState with _$LatLngRequestState {
  const factory LatLngRequestState({
    @Default(0.0) double lat,
    @Default(0.0) double lng,
  }) = _LatLngRequestState;
}
