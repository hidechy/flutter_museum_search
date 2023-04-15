import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'lat_lng_request_state.dart';
import 'lat_lng_response_state.dart';

////////////////////////////////////////////////
final latLngProvider =
    StateNotifierProvider.autoDispose<LatLngNotifier, LatLngResponseState>(
        (ref) {
  return LatLngNotifier(
    const LatLngResponseState(lat: 0, lng: 0),
  );
});

class LatLngNotifier extends StateNotifier<LatLngResponseState> {
  LatLngNotifier(super.state);

  ///
  Future<void> setLatLng({required LatLngRequestState param}) async {
    state = state.copyWith(lat: param.lat, lng: param.lng);
  }

  ///
  Future<void> clearLatLng() async {
    state = state.copyWith(lat: 0, lng: 0);
  }
}

////////////////////////////////////////////////
