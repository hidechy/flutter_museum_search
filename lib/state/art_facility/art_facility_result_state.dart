import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/art_facility.dart';

part 'art_facility_result_state.freezed.dart';

@freezed
class ArtFacilityResultState with _$ArtFacilityResultState {
  const factory ArtFacilityResultState({
    //
    @Default([]) List<Facility> allList,

    //
    @Default([]) List<int> allIdList,

    //
    @Default([]) List<int> selectIdList,

    //
    @Default({}) Map<int, Facility> facilityMap,

    ///
    @Default([]) List<String> facilityLatLng,

    ///
    @Default(3) int selectedRadius,
  }) = _ArtFacilityResultState;
}
