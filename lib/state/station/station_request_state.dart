import 'package:freezed_annotation/freezed_annotation.dart';

part 'station_request_state.freezed.dart';

@freezed
class StationRequestState with _$StationRequestState {
  const factory StationRequestState({
    //
    @Default([]) List<String> facilityLatLng,
  }) = _StationRequestState;
}
