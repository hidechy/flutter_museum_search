// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapbox_polyline_points/mapbox_polyline_points.dart';

import '../extensions/extensions.dart';
import '../models/art_facility.dart';

class FlutterMapScreen extends ConsumerStatefulWidget {
  const FlutterMapScreen({Key? key, required this.facilityList})
      : super(key: key);

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

  ///
  @override
  Widget build(BuildContext context) {
    makeBounds();

    makeMarker();

    makePolyline();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        makePolyline();
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
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
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  ),
                  MarkerLayer(markers: markerList),
                  PolylineLayer(polylines: polylineList),
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
    for (var i = 0; i < widget.facilityList.length; i++) {
      markerList.add(
        Marker(
          point: LatLng(
            widget.facilityList[i].latitude.toDouble(),
            widget.facilityList[i].longitude.toDouble(),
          ),
          builder: (context) {
            return CircleAvatar(
              radius: 5,
              backgroundColor: Colors.black,
              child: Text(
                (i + 1).toString(),
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
    for (var i = 0; i < widget.facilityList.length - 1; i++) {
      var result = await mapboxpolylinePoints.getRouteBetweenCoordinates(
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
        List<LatLng> points = [];

        element.forEach((element2) {
          points.add(LatLng(element2.latitude, element2.longitude));
        });

        polylineList.add(
          Polyline(points: points, color: Colors.blue, strokeWidth: 5),
        );
      });
    }

    setState(() {});
  }
}
