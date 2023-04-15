import 'package:freezed_annotation/freezed_annotation.dart';

part 'lat_lng_response_state.freezed.dart';

@freezed
class LatLngResponseState with _$LatLngResponseState {
  const factory LatLngResponseState({
    @Default(0.0) double lat,
    @Default(0.0) double lng,
  }) = _LatLngResponseState;
}
