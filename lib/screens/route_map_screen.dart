// ignore_for_file: must_be_immutable, inference_failure_on_untyped_parameter, avoid_dynamic_calls

import 'dart:async';
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

class RouteMapScreen extends ConsumerWidget {
  RouteMapScreen({super.key, required this.facilityMap});

  final Map<String, Facility> facilityMap;

  late CameraPosition basePoint;

  ///
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late LatLngBounds bounds;

  List<double> latList = [];
  List<double> lngList = [];

  Set<Marker> markers = {};

  Set<Polyline> polylineSet = {};

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    setMarker();

    mapInit();

    final now = DateTime.now();
    final timeFormat = DateFormat('HH:mm:ss');
    final currentTime = timeFormat.format(now);

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
                initialCameraPosition: basePoint,
                onMapCreated: _controller.complete,
                markers: markers,
                polylines: polylineSet,
              ),
            ),
            //------------------------------------//

            Container(
              padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
              child: DefaultTextStyle(
                style: const TextStyle(fontSize: 12),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          child: Text(
                            'start',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(facilityMap['origin']!.name),
                              Text(facilityMap['origin']!.address),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.orangeAccent,
                          foregroundColor: Colors.white,
                          child: Text(
                            'goal',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(facilityMap['destination']!.name),
                              Text(facilityMap['destination']!.address),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //

            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    await ref
                        .watch(navitimeShapeTransitProvider(
                          const NavitimeShapeTransitRequestState(),
                        ).notifier)
                        .getNavitimeShapeTransit(
                          param: NavitimeShapeTransitRequestState(
                            start: '${facilityMap['origin']!.latitude},'
                                '${facilityMap['origin']!.longitude}',
                            goal: '${facilityMap['destination']!.latitude},'
                                '${facilityMap['destination']!.longitude}',
                            startTime: '${now.yyyymmdd}T$currentTime',
                          ),
                        );

                    await setBounds();
                  },
                  icon: const Icon(Icons.stacked_line_chart, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  void setMarker() {
    markers = {};

    markers
      ..add(
        Marker(
          markerId: MarkerId(facilityMap['origin']!.name),
          position: LatLng(
            facilityMap['origin']!.latitude.toDouble(),
            facilityMap['origin']!.longitude.toDouble(),
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      )
      ..add(
        Marker(
          markerId: MarkerId(facilityMap['destination']!.name),
          position: LatLng(
            facilityMap['destination']!.latitude.toDouble(),
            facilityMap['destination']!.longitude.toDouble(),
          ),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        ),
      );
  }

  ///
  Future<void> mapInit() async {
    basePoint = CameraPosition(
      target: LatLng(
        facilityMap['origin']!.latitude.toDouble(),
        facilityMap['origin']!.longitude.toDouble(),
      ),
      zoom: 14,
    );

    bounds = LatLngBounds(
      southwest: LatLng(
        facilityMap['origin']!.latitude.toDouble(),
        facilityMap['origin']!.longitude.toDouble(),
      ),
      northeast: LatLng(
        facilityMap['origin']!.latitude.toDouble(),
        facilityMap['origin']!.longitude.toDouble(),
      ),
    );
  }

  ///
  Future<void> setBounds() async {
    latList = [];
    lngList = [];

    latList
      ..add(facilityMap['origin']!.latitude.toDouble())
      ..add(facilityMap['destination']!.latitude.toDouble());

    lngList
      ..add(facilityMap['origin']!.longitude.toDouble())
      ..add(facilityMap['destination']!.longitude.toDouble());

    final minSouthwestLat = latList.reduce(min);
    final maxNortheastLat = latList.reduce(max);
    final minSouthwestLng = lngList.reduce(min);
    final maxNortheastLng = lngList.reduce(max);

    bounds = LatLngBounds(
      southwest: LatLng(minSouthwestLat, minSouthwestLng),
      northeast: LatLng(maxNortheastLat, maxNortheastLng),
    );

    final controller = await _controller.future;

    await controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
  }

  ///
  void makePolyline() {
    final list = _ref.watch(navitimeShapeTransitProvider(
      const NavitimeShapeTransitRequestState(),
    ).select((value) => value.list));

    final poly = <LatLng>[];

    list.forEach((element) {
      final origin = element as NavitimeShapeTransitResponseItemState;

      poly.add(
        LatLng(origin.latitude.toDouble(), origin.longitude.toDouble()),
      );
    });

    polylineSet.add(
      Polyline(
        polylineId: const PolylineId('overview_polyline'),
        color: Colors.redAccent,
        width: 5,
        points: poly,
      ),
    );
  }
}
