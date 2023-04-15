import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/art_facility.dart';

part 'art_facility_result_state.freezed.dart';

@freezed
class ArtFacilityResultState with _$ArtFacilityResultState {
  const factory ArtFacilityResultState({
    @Default([]) List<Facility> allList,
    @Default([]) List<int> allIdList,
    @Default([]) List<int> selectIdList,
  }) = _ArtFacilityResultState;
}
