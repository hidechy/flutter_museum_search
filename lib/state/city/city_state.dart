import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/city.dart';

part 'city_state.freezed.dart';

@freezed
class CityState with _$CityState {
  const factory CityState({
    //
    @Default([]) List<CityData> cityList,
    //
    @Default('') String selectCityCode,

    //
    @Default({}) Map<String, CityData> cityMap,
  }) = _CityState;
}
