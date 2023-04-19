import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'map_marker_state.dart';

//////////////////////////////////////////////////////
final mapMarkerProvider =
    StateNotifierProvider.autoDispose<MapMarkerNotifier, MapMarkerState>((ref) {
  return MapMarkerNotifier(const MapMarkerState());
});

class MapMarkerNotifier extends StateNotifier<MapMarkerState> {
  MapMarkerNotifier(super.state);

  ///
  Future<void> setNumbersList(
      {required List<BitmapDescriptor> numbersList}) async {
    state = state.copyWith(numbersList: numbersList);
  }
}

//////////////////////////////////////////////////////
