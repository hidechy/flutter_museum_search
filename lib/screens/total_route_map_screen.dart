// ignore_for_file: must_be_immutable, cascade_invocations

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../extensions/extensions.dart';
import '../models/art_facility.dart';
import '../state/navitime_shape_transit/navitime_shape_transit_notifier.dart';
import '../state/navitime_shape_transit/navitime_shape_transit_request_state.dart';
import '../state/navitime_shape_transit/navitime_shape_transit_response_state.dart';
import '../utility/utility.dart';

class TotalRouteMapScreen extends ConsumerWidget {
  TotalRouteMapScreen({super.key, required this.facilityList});

  Utility utility = Utility();

  final List<Facility> facilityList;

  late CameraPosition basePoint;

  Set<Marker> markers = {};

  Set<Polyline> polylineSet = {};

  late LatLngBounds bounds;

  List<double> latList = [];
  List<double> lngList = [];

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    var twelveColor = utility.getTwelveColor();

    final now = DateTime.now();
    final timeFormat = DateFormat('HH:mm:ss');
    final currentTime = timeFormat.format(now);

    for (var i = 0; i < facilityList.length - 1; i++) {
      final navitimeShapeTransitState = _ref.watch(navitimeShapeTransitProvider(
        NavitimeShapeTransitRequestState(
          interlocking: true,
          start: '${facilityList[i].latitude},${facilityList[i].longitude}',
          goal:
              '${facilityList[i + 1].latitude},${facilityList[i + 1].longitude}',
          startTime: '${now.yyyymmdd}T$currentTime',
        ),
      ));

      final poly = <LatLng>[];

      final nsList = navitimeShapeTransitState.list as List;

      nsList.forEach((element) {
        final origin = element as NavitimeShapeTransitResponseItemState;
        poly.add(
          LatLng(origin.latitude.toDouble(), origin.longitude.toDouble()),
        );
      });

      polylineSet.add(
        Polyline(
          polylineId: PolylineId('overview_polyline($i)'),
          color: twelveColor[i],
          width: 5,
          points: poly,
        ),
      );
    }
  }
}
