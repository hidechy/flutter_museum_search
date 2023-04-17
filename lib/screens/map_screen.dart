// ignore_for_file: must_be_immutable, cascade_invocations, inference_failure_on_untyped_parameter, avoid_dynamic_calls

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:url_launcher/url_launcher.dart';

import '../extensions/extensions.dart';
import '../state/art_facility/art_facility_notifier.dart';
import '../state/lat_lng/lat_lng_notifier.dart';
import '../state/lat_lng_address/lat_lng_address_notifier.dart';
import '../state/lat_lng_address/lat_lng_address_request_state.dart';
import '../state/map_marker/map_marker_notifier.dart';
import '../state/navitime_shape_transit/navitime_shape_transit_notifier.dart';
import '../state/navitime_shape_transit/navitime_shape_transit_request_state.dart';
import '../state/navitime_shape_transit/navitime_shape_transit_response_state.dart';

class MapScreen extends ConsumerWidget {
  MapScreen({super.key});

  ///
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  List<double> latList = [];
  List<double> lngList = [];

  Set<Polyline> polylineSet = {};

  late LatLngBounds bounds;

  late BuildContext _context;
  late WidgetRef _ref;

  late CameraPosition basePoint;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    mapInit();

    final markers =
        ref.watch(mapMarkerProvider.select((value) => value.markers));

    final selectIdList =
        ref.watch(artFacilityProvider.select((value) => value.selectIdList));

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

            if (selectIdList.isNotEmpty)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await ref
                              .read(mapMarkerProvider.notifier)
                              .getFacilityMarker();

                          await setBounds();
                        },
                        icon: const Icon(Icons.location_on),
                      ),
                      IconButton(
                        onPressed: () async {
                          await setBounds();
                        },
                        icon: const Icon(Icons.vignette_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: displayFacilities(),
                  ),
                ],
              ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> mapInit() async {
    final latLngState = _ref.watch(latLngProvider);

    basePoint = CameraPosition(
      target: LatLng(latLngState.lat, latLngState.lng),
      zoom: 14,
    );

    bounds = LatLngBounds(
      southwest: LatLng(latLngState.lat, latLngState.lng),
      northeast: LatLng(latLngState.lat, latLngState.lng),
    );
  }

  ///
  Future<void> setBounds() async {
    latList = [];
    lngList = [];

    final latLngState = _ref.watch(latLngProvider);
    latList.add(latLngState.lat);
    lngList.add(latLngState.lng);

    final artFacilityState = _ref.watch(artFacilityProvider);

    artFacilityState.allList.forEach((element) {
      if (artFacilityState.selectIdList.contains(element.id)) {
        latList.add(element.latitude.toDouble());
        lngList.add(element.longitude.toDouble());
      }
    });

    if (latList.isNotEmpty && lngList.isNotEmpty) {
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
  }

  ///
  Widget displayFacilities() {
    final list = <Widget>[];

    final artFacilityState = _ref.watch(artFacilityProvider);

    final selectName =
        _ref.watch(mapMarkerProvider.select((value) => value.selectName));

    final latLngState = _ref.watch(latLngProvider);

    final now = DateTime.now();
    final timeFormat = DateFormat('HH:mm:ss');
    final currentTime = timeFormat.format(now);

    artFacilityState.allList.forEach((element) {
      if (artFacilityState.selectIdList.contains(element.id)) {
        list.add(
          Container(
            width: 150,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(0.6),
                width: 2,
              ),
              color: (element.name == selectName)
                  ? Colors.yellowAccent.withOpacity(0.2)
                  : Colors.transparent,
            ),
            child: DefaultTextStyle(
              style: const TextStyle(fontSize: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: _context.screenSize.height / 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            element.dist,
                            style: const TextStyle(color: Colors.yellowAccent),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(element.name, maxLines: 3),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await _ref
                              .watch(navitimeShapeTransitProvider.notifier)
                              .getNavitimeShapeTransit(
                                param: NavitimeShapeTransitRequestState(
                                  start:
                                      '${latLngState.lat},${latLngState.lng}',
                                  goal:
                                      '${element.latitude},${element.longitude}',
                                  startTime: '${now.yyyymmdd}T$currentTime',
                                ),
                              );

                          await _ref
                              .read(mapMarkerProvider.notifier)
                              .getSelectedFacilityMarker(name: element.name);
                        },
                        child: const Icon(Icons.stacked_line_chart, size: 20),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await _ref
                              .watch(latLngAddressProvider.notifier)
                              .getLatLngAddress(
                                param: LatLngAddressRequestState(
                                  latitude: element.latitude,
                                  longitude: element.longitude,
                                ),
                              );

                          await showGoogleMap(
                            latitude: element.latitude,
                            longitude: element.longitude,
                          );
                        },
                        child: const Icon(FontAwesomeIcons.google, size: 20),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await _ref
                              .watch(latLngAddressProvider.notifier)
                              .getLatLngAddress(
                                param: LatLngAddressRequestState(
                                  latitude: element.latitude,
                                  longitude: element.longitude,
                                ),
                              );

                          await showYahooMap();
                        },
                        child: const Icon(FontAwesomeIcons.yahoo, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: list),
    );
  }

  ///
  Future<void> showYahooMap() async {
    // 先にdestinationを取得 // 順番変えてはいけない
    final destinationLLAS = _ref.watch(latLngAddressProvider);

    //------------------------------------// origin
    final latLngState = _ref.watch(latLngProvider);

    await _ref.watch(latLngAddressProvider.notifier).getLatLngAddress(
          param: LatLngAddressRequestState(
            latitude: latLngState.lat.toString(),
            longitude: latLngState.lng.toString(),
          ),
        );

    final originLLAS = _ref.watch(latLngAddressProvider);
    //------------------------------------// origin

    final hourFormat = DateFormat('HH');
    final minuteFormat = DateFormat('mm');

    final now = DateTime.now();

    final queryParameters = <String>[
      'from=${originLLAS.city}${originLLAS.town}',
      'to=${destinationLLAS.city}${destinationLLAS.town}',
      't=1',
      'y=${now.year}${now.month.toString().padLeft(2, '0')}',
      'd=${now.day}',
      'h=${hourFormat.format(now)}',
      'm=${minuteFormat.format(now)}',
      'sort=1',
      'lat=${latLngState.lat}',
      'lon=${latLngState.lng}',
      'zoom=13',
      'maptype=basic'
    ];

    final url =
        'https://map.yahoo.co.jp/route/train?${queryParameters.join('&')}';

    final mapUrl = Uri.parse(url);
    if (!await launchUrl(mapUrl, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  ///
  Future<void> showGoogleMap(
      {required String latitude, required String longitude}) async {
    // 先にdestinationを取得 // 順番変えてはいけない
    final destinationLLAS = _ref.watch(latLngAddressProvider);

    //------------------------------------// origin
    final latLngState = _ref.watch(latLngProvider);

    final queryParameters = <String>[
      'https://www.google.co.jp/maps/dir',
      '${latLngState.lat},${latLngState.lng}',
      '${destinationLLAS.city}${destinationLLAS.town}',
      '@$latitude,$longitude'
    ];

    final url = queryParameters.join('/');

    final mapUrl = Uri.parse(url);
    if (!await launchUrl(mapUrl, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  ///
  void makePolyline() {
    final list =
        _ref.watch(navitimeShapeTransitProvider.select((value) => value.list));

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
