// ignore_for_file: must_be_immutable, inference_failure_on_collection_literal, unrelated_type_equality_checks, avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:museum_search/models/art_facility.dart';
import 'package:museum_search/state/art_facility/art_facility_notifier.dart';

import '../../extensions/extensions.dart';

// import '../../models/lat_lng_temple.dart';
// import '../../state/current_lat_lng/current_lat_lng_notifier.dart';
// import '../../state/lat_lng_address/lat_lng_address_notifier.dart';
// import '../../state/lat_lng_address/lat_lng_address_request_state.dart';
// import '../../state/select_route/select_route_notifier.dart';
//
// // import '../../state/temple_all/temple_all_notifier.dart';
// // import '../../state/tokyo_train/tokyo_train_notifier.dart';
import '../../state/app_param/app_param_notifier.dart';
import '../../state/lat_lng/lat_lng_notifier.dart';
import '../../state/lat_lng_address/lat_lng_address_notifier.dart';
import '../../state/lat_lng_address/lat_lng_address_request_state.dart';
import '../../state/select_route/select_route_notifier.dart';
import '../../state/station/nearly/station_notifier.dart';
import '../../state/station/train_station/train_station_notifier.dart';
import '../../utility/utility.dart';

class SelectRouteDisplayAlert extends ConsumerWidget {
  SelectRouteDisplayAlert({super.key});

  Utility utility = Utility();

  bool facilityStart = true;

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(width: context.screenSize.width),
              Expanded(child: displaySelectRoute()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  List<Facility> getFacilityList() {
    final selectedIds =
        _ref.watch(selectRouteProvider.select((value) => value.selectedIds));

    final latLngAddressState = _ref.watch(latLngAddressProvider(
      const LatLngAddressRequestState(),
    ));

    final currentLatLngState = _ref.watch(latLngProvider);

    final stationMap =
        _ref.watch(stationProvider.select((value) => value.stationMap));

    final facilityMap =
        _ref.watch(artFacilityProvider.select((value) => value.facilityMap));

    /////////

    var trainStationMap = {};
    final appParamState = _ref.watch(appParamProvider);
    if (appParamState != '') {
      trainStationMap = _ref.watch(
        trainStationProvider(appParamState.selectedCompanyTrainId).select(
          (value) => value.trainStationMap,
        ),
      );
    }

    //--------------------------------------------------- first
    final firstId = selectedIds.first;
    final fId = firstId.replaceAll('start_', '');

    var firstItem = Facility(
      id: 0,
      name: '',
      genre: '',
      address: '',
      latitude: '',
      longitude: '',
      dist: '',
    );

    if (fId == '0') {
      firstItem = Facility(
        id: 0,
        name: '現在位置',
        genre: '',
        address: '${latLngAddressState.city}${latLngAddressState.town}',
        latitude: currentLatLngState.lat.toString(),
        longitude: currentLatLngState.lng.toString(),
        dist: '',
      );

      facilityStart = false;
    } else if (stationMap[fId.toInt()] != null) {
      firstItem = Facility(
        id: stationMap[fId.toInt()]!.id,
        name: stationMap[fId.toInt()]!.stationName,
        genre: '',
        address: stationMap[fId.toInt()]!.address,
        latitude: stationMap[fId.toInt()]!.lat,
        longitude: stationMap[fId.toInt()]!.lng,
        dist: '',
      );

      facilityStart = false;
    } else if (facilityMap[fId.toInt()] != null) {
      firstItem = facilityMap[fId.toInt()]!;
    }
    //--------------------------------------------------- first

    //--------------------------------------------------- last
    final lastId = selectedIds.last;
    final lId = lastId.replaceAll('goal_', '');

    var lastItem = Facility(
      id: 0,
      name: '',
      genre: '',
      address: '',
      latitude: '',
      longitude: '',
      dist: '',
    );

    if (lId == '0') {
      lastItem = Facility(
        id: 0,
        name: '現在位置',
        genre: '',
        address: '${latLngAddressState.city}${latLngAddressState.town}',
        latitude: currentLatLngState.lat.toString(),
        longitude: currentLatLngState.lng.toString(),
        dist: '',
      );
    } else if (stationMap[lId.toInt()] != null) {
      lastItem = Facility(
        id: stationMap[lId.toInt()]!.id,
        name: stationMap[lId.toInt()]!.stationName,
        genre: '',
        address: stationMap[lId.toInt()]!.address,
        latitude: stationMap[lId.toInt()]!.lat,
        longitude: stationMap[lId.toInt()]!.lng,
        dist: '',
      );
    } else if (trainStationMap[lId.toInt()] != null) {
      lastItem = Facility(
        id: trainStationMap[lId.toInt()].id.toString().toInt(),
        name: trainStationMap[lId.toInt()].stationName.toString(),
        genre: '',
        address: trainStationMap[lId.toInt()].address.toString(),
        latitude: trainStationMap[lId.toInt()].lat.toString(),
        longitude: trainStationMap[lId.toInt()].lng.toString(),
        dist: '',
      );
    } else if (facilityMap[lId.toInt()] != null) {
      lastItem = facilityMap[lId.toInt()]!;
    }

    //--------------------------------------------------- last

    final facilityList = <Facility>[firstItem];
    for (var i = 1; i < selectedIds.length - 1; i++) {
      final facility = facilityMap[selectedIds[i].toInt()];
      if (facility != null) {
        facilityList.add(facility);
      }
    }
    facilityList.add(lastItem);

    return facilityList;
  }

  ///
  Widget displaySelectRoute() {
    final facilityList = getFacilityList();

    final selectRouteState = _ref.watch(selectRouteProvider);

    final timeFormat = DateFormat('HH:mm');
    final startTime =
        timeFormat.format(DateTime.parse(selectRouteState.startTime));

    var keepEndTime = '';

    final list = <Widget>[];

    for (var i = 0; i < facilityList.length; i++) {
      final ll = [facilityList[i].latitude, facilityList[i].longitude];

      var distance = '';
      var walkMinutes = 0;
      if (i < facilityList.length - 1) {
        if ((facilityList[i].latitude == facilityList[i + 1].latitude) &&
            (facilityList[i].longitude == facilityList[i + 1].longitude)) {
          //TODO 緯度経度が同じ場合
          distance = '0';
        } else {
          distance = utility.calcDistance(
            originLat: facilityList[i].latitude.toDouble(),
            originLng: facilityList[i].longitude.toDouble(),
            destLat: facilityList[i + 1].latitude.toDouble(),
            destLng: facilityList[i + 1].longitude.toDouble(),
          );
        }

        final dist1000 =
            int.parse((double.parse(distance) * 1000).toString().split('.')[0]);
        final ws = selectRouteState.walkSpeed * 1000;
        final percent = (100 + selectRouteState.adjustPercent) / 100;
        walkMinutes = ((dist1000 / ws * 60) * percent).round();
      }

      var st = (i == 0) ? startTime : keepEndTime;

      var spotStayTime = 0;
      if (facilityList[i].genre != '') {
        spotStayTime = selectRouteState.spotStayTime;

        st = getTimeStr(time: st, minutes: selectRouteState.spotStayTime);
      }

      final endTime = getTimeStr(time: st, minutes: walkMinutes);

      list.add(
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  //TODO 始点、終点ともに現在地、または駅が選ばれている場合は緑にする
                  backgroundColor: (selectRouteState.startGoalBothSelect)
                      ? (i == 0 || i == facilityList.length - 1)
                          ? Colors.green.withOpacity(0.4)
                          : Colors.black.withOpacity(0.4)

                      //TODO そうじゃない時は始点のみインディゴにする
                      : (facilityStart == false && i == 0)
                          ? Colors.indigo.withOpacity(0.4)
                          : Colors.black.withOpacity(0.4),
                  child: Text(
                    i.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(facilityList[i].name),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (facilityList[i].address != '')
                              Text(facilityList[i].address),
                            Text(
                              ll.join(' / '),
                              style: const TextStyle(fontSize: 8),
                            ),
                            if (facilityList[i].genre != '')
                              Text('滞在時間：$spotStayTime 分'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (i < facilityList.length - 1)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_downward_outlined,
                    size: 40,
                    color: Colors.white.withOpacity(0.4),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(st),
                      Row(
                        children: [
                          Text('$distance Km'),
                          const Text(' / '),
                          Text('$walkMinutes 分'),
                        ],
                      ),
                      Text(endTime),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 30),
          ],
        ),
      );

      keepEndTime = endTime;
    }

    return SingleChildScrollView(
      child: Column(children: list),
    );
  }

  ///
  String getTimeStr({required String time, required int minutes}) {
    final dt = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      time.split(':')[0].toInt(),
      time.split(':')[1].toInt(),
    ).add(Duration(minutes: minutes));

    final timeFormat = DateFormat('HH:mm');

    return timeFormat.format(dt);
  }
}
