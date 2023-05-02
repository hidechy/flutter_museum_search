import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/train_station.dart';

part 'train_station_response_state.freezed.dart';

@freezed
class TrainStationResponseState with _$TrainStationResponseState {
  const factory TrainStationResponseState({
    //
    @Default([]) List<Station> trainStationList,

    //
    @Default({}) Map<int, Station> trainStationMap,
  }) = _TrainStationResponseState;
}
