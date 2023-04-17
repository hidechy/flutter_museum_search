import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/art_facility.dart';
import '../art_facility/art_facility_notifier.dart';
import '../art_facility/art_facility_result_state.dart';
import '../lat_lng/lat_lng_notifier.dart';
import '../lat_lng/lat_lng_response_state.dart';
import 'map_marker_state.dart';

//////////////////////////////////////////////////////
final mapMarkerProvider =
    StateNotifierProvider.autoDispose<MapMarkerNotifier, MapMarkerState>((ref) {
  final latLngState = ref.watch(latLngProvider);

  final artFacilityState = ref.watch(artFacilityProvider);

  return MapMarkerNotifier(
    const MapMarkerState(),
    latLngState: latLngState,
    artFacilityState: artFacilityState,
  )..getInitMarker();
});

class MapMarkerNotifier extends StateNotifier<MapMarkerState> {
  MapMarkerNotifier(super.state,
      {required this.latLngState, required this.artFacilityState});

  final LatLngResponseState latLngState;
  final ArtFacilityResultState artFacilityState;

  ///
  Future<void> getInitMarker() async {
    final marker = Marker(
      markerId: const MarkerId('currentPosition'),
      position: LatLng(latLngState.lat, latLngState.lng),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );

    state = state.copyWith(markers: {marker});
  }

  ///
  Future<void> getFacilityMarker() async {
    final markers = <Marker>{}..add(
        Marker(
          markerId: const MarkerId('currentPosition'),
          position: LatLng(latLngState.lat, latLngState.lng),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );

    artFacilityState.allList.forEach((element) {
      if (artFacilityState.selectIdList.contains(element.id)) {
        markers.add(
          Marker(
            markerId: MarkerId(element.name),
            position: LatLng(
              element.latitude.toDouble(),
              element.longitude.toDouble(),
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueOrange),
          ),
        );
      }
    });

    state = state.copyWith(markers: markers, selectName: '');
  }

  ///
  Future<void> getSelectedFacilityMarker({required String name}) async {
    final markers = <Marker>{}..add(
        Marker(
          markerId: const MarkerId('currentPosition'),
          position: LatLng(latLngState.lat, latLngState.lng),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );

    var selectedFacility = Facility(
      id: 0,
      name: '',
      genre: '',
      address: '',
      latitude: '',
      longitude: '',
      dist: '',
    );

    artFacilityState.allList.forEach((element) {
      if (artFacilityState.selectIdList.contains(element.id)) {
        if (name == element.name) {
          selectedFacility = element;
        } else {
          markers.add(
            Marker(
              markerId: MarkerId(element.name),
              position: LatLng(
                element.latitude.toDouble(),
                element.longitude.toDouble(),
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange),
            ),
          );
        }
      }
    });

    markers.add(
      Marker(
        markerId: MarkerId(selectedFacility.name),
        position: LatLng(
          selectedFacility.latitude.toDouble(),
          selectedFacility.longitude.toDouble(),
        ),
        infoWindow: InfoWindow(title: selectedFacility.address),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );

    state = state.copyWith(markers: markers, selectName: name);
  }
}

//////////////////////////////////////////////////////
