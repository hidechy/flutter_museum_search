// ignore_for_file: must_be_immutable, cascade_invocations

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:museum_search/state/app_param/app_param_notifier.dart';

import '../extensions/extensions.dart';
import '../models/art_facility.dart';
import '../state/navitime_shape_transit/navitime_shape_transit_notifier.dart';
import '../state/navitime_shape_transit/navitime_shape_transit_request_state.dart';
import '../state/navitime_shape_transit/navitime_shape_transit_response_state.dart';

class RouteMapScreen extends ConsumerWidget {
  RouteMapScreen({super.key, required this.facilityList});

  final List<Facility> facilityList;

  late CameraPosition basePoint;

  Set<Marker> markers = {};

  Set<Polyline> polylineSet = {};

  late LatLngBounds bounds;

  List<double> latList = [];
  List<double> lngList = [];

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    mapInit();

    makeBounds();

    makePolyline();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                TextButton(
                  onPressed: showUnderMenu,
                  child: const Text('show detail'),
                ),
              ],
            ),

            //------------------------------------//
            Expanded(
              child: GoogleMap(
                mapType: MapType.terrain,
                initialCameraPosition: basePoint,
                onMapCreated: (controller) {
                  Future<dynamic>.delayed(
                    const Duration(milliseconds: 1000),
                  ).then(
                    (dynamic _) {
                      controller.animateCamera(
                        CameraUpdate.newLatLngBounds(bounds, 50),
                      );
                    },
                  );
                },
                markers: markers,
                polylines: polylineSet,
              ),
            ),
            //------------------------------------//
          ],
        ),
      ),
    );
  }

  ///
  void mapInit() {
    basePoint = CameraPosition(
      target: LatLng(
        facilityList[0].latitude.toDouble(),
        facilityList[0].longitude.toDouble(),
      ),
      zoom: 14,
    );

    markers = {};

    markers.add(
      Marker(
        markerId: MarkerId(facilityList[0].name),
        position: LatLng(
          facilityList[0].latitude.toDouble(),
          facilityList[0].longitude.toDouble(),
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );

    for (var i = 1; i < facilityList.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId(facilityList[i].name),
          position: LatLng(
            facilityList[i].latitude.toDouble(),
            facilityList[i].longitude.toDouble(),
          ),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        ),
      );
    }
  }

  ///
  void makeBounds() {
    latList = [];
    lngList = [];

    facilityList.forEach((element) {
      latList.add(element.latitude.toDouble());
      lngList.add(element.longitude.toDouble());
    });

    final minSouthwestLat = latList.reduce(min);
    final maxNortheastLat = latList.reduce(max);
    final minSouthwestLng = lngList.reduce(min);
    final maxNortheastLng = lngList.reduce(max);

    bounds = LatLngBounds(
      southwest: LatLng(minSouthwestLat, minSouthwestLng),
      northeast: LatLng(maxNortheastLat, maxNortheastLng),
    );
  }

  ///
  void makePolyline() {
    final now = DateTime.now();
    final timeFormat = DateFormat('HH:mm:ss');
    final currentTime = timeFormat.format(now);

    final selectedRouteStart = _ref
        .watch(appParamProvider.select((value) => value.selectedRouteStart));

    print('AAAAAA');
    print(selectedRouteStart);
    print('AAAAAA');

    //TODO 利用制限があるため、暫定的にコメントアウト
    //
    // for (var i = 0; i < facilityList.length - 1; i++) {
    //   final navitimeShapeTransitState = _ref.watch(navitimeShapeTransitProvider(
    //     NavitimeShapeTransitRequestState(
    //       interlocking: true,
    //       start: '${facilityList[i].latitude},${facilityList[i].longitude}',
    //       goal:
    //           '${facilityList[i + 1].latitude},${facilityList[i + 1].longitude}',
    //       startTime: '${now.yyyymmdd}T$currentTime',
    //     ),
    //   ));
    //
    //   final poly = <LatLng>[];
    //
    //   final nsList = navitimeShapeTransitState.list as List;
    //
    //   nsList.forEach((element) {
    //     final origin = element as NavitimeShapeTransitResponseItemState;
    //     poly.add(
    //       LatLng(origin.latitude.toDouble(), origin.longitude.toDouble()),
    //     );
    //   });
    //
    //   polylineSet.add(
    //     Polyline(
    //       polylineId: PolylineId('overview_polyline($i)'),
    //       color: Colors.grey,
    //       width: 5,
    //       points: poly,
    //     ),
    //   );
    // }
  }

  ///
  Future<dynamic> showUnderMenu() async {
    return showModalBottomSheet(
      backgroundColor: Colors.black.withOpacity(0.1),
      context: _context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              border: Border(
                top: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 5,
                ),
              ),
            ),
            child: Container(
              height: 250,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: displayBottomSheetContent(),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  ///
  List<Widget> displayBottomSheetContent() {
    final list = <Widget>[];

    for (var i = 0; i < facilityList.length; i++) {
      list.add(
        DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: (i == 0)
                        ? Colors.blueAccent.withOpacity(0.6)
                        : Colors.orangeAccent.withOpacity(0.4),
                    foregroundColor: Colors.white,
                    child: Text((i + 1).toString()),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(facilityList[i].name),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(facilityList[i].address),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (i < facilityList.length - 1)
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 40),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_downward_outlined),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () async {
                          final llList = [
                            facilityList[i].latitude,
                            facilityList[i].longitude
                          ];

                          await _ref
                              .watch(appParamProvider.notifier)
                              .setSelectedRouteStart(
                                  selectedRouteStart: llList.join(','));
                        },
                        child: const Chip(
                          backgroundColor: Colors.black,
                          label: Text(
                            '選択',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return list;
  }
}
