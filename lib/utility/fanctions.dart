// ignore_for_file: inference_failure_on_collection_literal, unrelated_type_equality_checks, avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../extensions/extensions.dart';
import '../models/art_facility.dart';
import '../state/app_param/app_param_notifier.dart';
import '../state/art_facility/art_facility_notifier.dart';
import '../state/lat_lng/lat_lng_notifier.dart';
import '../state/lat_lng_address/lat_lng_address_notifier.dart';
import '../state/lat_lng_address/lat_lng_address_request_state.dart';
import '../state/station/nearly/station_notifier.dart';
import '../state/station/train_station/train_station_notifier.dart';

Facility getStartGoalData({required WidgetRef ref, required int id}) {
  final latLngAddressState = ref.watch(latLngAddressProvider(
    const LatLngAddressRequestState(),
  ));

  final currentLatLngState = ref.watch(latLngProvider);

  final stationMap =
      ref.watch(stationProvider.select((value) => value.stationMap));

  final facilityMap =
      ref.watch(artFacilityProvider.select((value) => value.facilityMap));

  var trainStationMap = {};
  final appParamState = ref.watch(appParamProvider);
  if (appParamState != '') {
    trainStationMap = ref.watch(
      trainStationProvider(appParamState.selectedCompanyTrainId).select(
        (value) => value.trainStationMap,
      ),
    );
  }

  //------------------------------------------//

  var item = Facility(
    id: 0,
    name: '',
    genre: '',
    address: '',
    latitude: '',
    longitude: '',
    dist: '',
  );

  if (id == '0') {
    item = Facility(
      id: 0,
      name: '現在位置',
      genre: '',
      address: '${latLngAddressState.city}${latLngAddressState.town}',
      latitude: currentLatLngState.lat.toString(),
      longitude: currentLatLngState.lng.toString(),
      dist: '',
    );
  } else if (stationMap[id] != null) {
    item = Facility(
      id: stationMap[id]!.id,
      name: stationMap[id]!.stationName,
      genre: '',
      address: stationMap[id]!.address,
      latitude: stationMap[id]!.lat,
      longitude: stationMap[id]!.lng,
      dist: '',
    );
  } else if (trainStationMap[id] != null) {
    item = Facility(
      id: trainStationMap[id].id.toString().toInt(),
      name: trainStationMap[id].stationName.toString(),
      genre: '',
      address: trainStationMap[id].address.toString(),
      latitude: trainStationMap[id].lat.toString(),
      longitude: trainStationMap[id].lng.toString(),
      dist: '',
    );
  } else if (facilityMap[id] != null) {
    item = facilityMap[id]!;
  }

  return item;
}
