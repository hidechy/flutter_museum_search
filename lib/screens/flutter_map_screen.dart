// ignore_for_file: depend_on_referenced_packages, must_be_immutable, inference_failure_on_collection_literal, use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapbox_polyline_points/mapbox_polyline_points.dart';
import 'package:url_launcher/url_launcher.dart';

import '../extensions/extensions.dart';
import '../models/art_facility.dart';
import '../state/app_param/app_param_notifier.dart';
import '../utility/utility.dart';

class FlutterMapScreen extends ConsumerStatefulWidget {
  const FlutterMapScreen({super.key, required this.facilityList});

  final List<Facility> facilityList;

  @override
  ConsumerState<FlutterMapScreen> createState() => _FlutterMapScreenState();
}

class _FlutterMapScreenState extends ConsumerState<FlutterMapScreen> {
  Map<String, double> boundsLatLngMap = {};

  late double boundsInner;

  List<Marker> markerList = [];

  List<Polyline> polylineList = [];

  MapboxpolylinePoints mapboxpolylinePoints = MapboxpolylinePoints();

  Utility utility = Utility();

  late BuildContext _context;

  ///
  @override
  Widget build(BuildContext context) {
    _context = context;

    makeBounds();

    makeMarker();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () async {
                    await ref
                        .watch(appParamProvider.notifier)
                        .clearSelectedRouteNumber();

                    await Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FlutterMapScreen(
                          facilityList: widget.facilityList,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.refresh),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
            Expanded(
              child: FlutterMap(
                options: MapOptions(
                  bounds: LatLngBounds(
                    LatLng(
                      boundsLatLngMap['minLat']! - boundsInner,
                      boundsLatLngMap['minLng']! - boundsInner,
                    ),
                    LatLng(
                      boundsLatLngMap['maxLat']! + boundsInner,
                      boundsLatLngMap['maxLng']! + boundsInner,
                    ),
                  ),
                  onMapReady: makePolyline,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  ),
                  PolylineLayer(polylines: polylineList),
                  MarkerLayer(markers: markerList),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  void makeBounds() {
    final latList = <double>[];
    final lngList = <double>[];

    widget.facilityList.forEach((element) {
      latList.add(element.latitude.toDouble());
      lngList.add(element.longitude.toDouble());
    });

    final minLat = latList.reduce(min);
    final maxLat = latList.reduce(max);
    final minLng = lngList.reduce(min);
    final maxLng = lngList.reduce(max);

    final latDiff = maxLat - minLat;
    final lngDiff = maxLng - minLng;
    final small = (latDiff < lngDiff) ? latDiff : lngDiff;
    boundsInner = small * 0.2;

    boundsLatLngMap = {
      'minLat': minLat,
      'maxLat': maxLat,
      'minLng': minLng,
      'maxLng': maxLng,
    };
  }

  ///
  void makeMarker() {
    markerList = [];

    final selectedRouteNumber = ref
        .watch(appParamProvider.select((value) => value.selectedRouteNumber));

    for (var i = 0; i < widget.facilityList.length; i++) {
      markerList.add(
        Marker(
          point: LatLng(
            widget.facilityList[i].latitude.toDouble(),
            widget.facilityList[i].longitude.toDouble(),
          ),
          builder: (context) {
            return CircleAvatar(
              backgroundColor: (i == 0)
                  ? (selectedRouteNumber == '0')
                      ? Colors.redAccent
                      : Colors.indigo
                  : (i.toString() == selectedRouteNumber)
                      ? Colors.redAccent
                      : Colors.black,
              child: Text(
                (i == 0) ? 'Here' : i.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      );
    }
  }

  ///
  Future<void> makePolyline() async {
    polylineList = [];

    final selectedRouteNumber = ref
        .watch(appParamProvider.select((value) => value.selectedRouteNumber));

    for (var i = 0; i < widget.facilityList.length - 1; i++) {
      final result = await mapboxpolylinePoints.getRouteBetweenCoordinates(
        dotenv.get('MAPBOX_ACCESS_TOKEN'),
        PointLatLng(
          latitude: widget.facilityList[i].latitude.toDouble(),
          longitude: widget.facilityList[i].longitude.toDouble(),
        ),
        PointLatLng(
          latitude: widget.facilityList[i + 1].latitude.toDouble(),
          longitude: widget.facilityList[i + 1].longitude.toDouble(),
        ),
        TravelType.walking,
      );

      result.points.forEach((element) {
        final points = <LatLng>[];

        element.forEach((element2) {
          points.add(LatLng(element2.latitude, element2.longitude));
        });

        polylineList.add(
          Polyline(
            points: points,
            color: (i.toString() == selectedRouteNumber)
                ? Colors.redAccent
                : Colors.blueAccent,
            strokeWidth: 5,
          ),
        );
      });
    }

    setState(() {});
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

    for (var i = 0; i < widget.facilityList.length; i++) {
      var distance = '';
      if (i < widget.facilityList.length - 1) {
        distance = utility.calcDistance(
          originLat: widget.facilityList[i].latitude.toDouble(),
          originLng: widget.facilityList[i].longitude.toDouble(),
          destLat: widget.facilityList[i + 1].latitude.toDouble(),
          destLng: widget.facilityList[i + 1].longitude.toDouble(),
        );
      }

      final ll = [
        widget.facilityList[i].latitude,
        widget.facilityList[i].longitude,
      ];

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
                        : Colors.black.withOpacity(0.4),
                    foregroundColor: Colors.white,
                    child: (i == 0)
                        ? const Text('Here', style: TextStyle(fontSize: 10))
                        : Text(i.toString()),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.facilityList[i].name),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.facilityList[i].address),
                              Text(ll.join(' / ')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (i < widget.facilityList.length - 1)
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.arrow_downward_outlined, size: 40),
                          const SizedBox(width: 10),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    await ref
                                        .watch(appParamProvider.notifier)
                                        .setSelectedRouteNumber(
                                            selectedRouteNumber: i.toString());

                                    await makePolyline();
                                  },
                                  icon: const Icon(Icons.stacked_line_chart,
                                      size: 20),
                                ),
                                IconButton(
                                  onPressed: () => showGoogleTransit(index: i),
                                  icon: const Icon(FontAwesomeIcons.google,
                                      size: 20),
                                ),
                                IconButton(
                                  onPressed: () => showYahooTransit(index: i),
                                  icon: const Icon(FontAwesomeIcons.yahoo,
                                      size: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '$distance Km',
                        style: const TextStyle(fontSize: 14),
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

  ///
  Future<void> showYahooTransit({required int index}) async {
    final hourFormat = DateFormat('HH');
    final minuteFormat = DateFormat('mm');

    final now = DateTime.now();

    final queryParameters = <String>[
      'from=${widget.facilityList[index].address}',
      'to=${widget.facilityList[index + 1].address}',
      't=1',
      'y=${now.year}${now.month.toString().padLeft(2, '0')}',
      'd=${now.day}',
      'h=${hourFormat.format(now)}',
      'm=${minuteFormat.format(now)}',
      'sort=1',
      'lat=${widget.facilityList[index].latitude}',
      'lon=${widget.facilityList[index].longitude}',
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
  Future<void> showGoogleTransit({required int index}) async {
    final ll = [
      widget.facilityList[index].latitude,
      widget.facilityList[index].longitude,
    ];

    final queryParameters = <String>[
      'https://www.google.co.jp/maps/dir',
      ll.join(','),
      (widget.facilityList[index + 1].address),
      '@${ll.join(',')}'
    ];

    final url = queryParameters.join('/');

    final mapUrl = Uri.parse(url);
    if (!await launchUrl(mapUrl, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
