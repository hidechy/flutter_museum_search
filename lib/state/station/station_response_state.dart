import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:museum_search/models/station.dart';

part 'station_response_state.freezed.dart';

@freezed
class StationResponseState with _$StationResponseState {
  const factory StationResponseState({
    //
    @Default([]) List<Station> stationList,

    ///
    @Default({}) Map<int, Station> stationMap,
  }) = _StationResponseState;
}
