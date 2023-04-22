// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../extensions/extensions.dart';
import '../models/art_facility.dart';

class FlutterMapScreen extends ConsumerWidget {
  FlutterMapScreen({super.key, required this.facilityList});

  final List<Facility> facilityList;

  Map<String, double> boundsLatLngMap = {};

  late double boundsInner;

  List<Marker> markerList = [];

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    makeBounds();

    makeMarker();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FlutterMapScreen(
                          facilityList: facilityList,
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

                  /*

                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: [
                          LatLng(35.340914, 139.64079), //八景島
                          LatLng(35.47804, 139.633466), //東神奈川

                          LatLng(35.681391, 139.766103), //東京
                          LatLng(35.729449, 140.827557), //銚子
                        ],
                        color: Colors.blue,
                        strokeWidth: 5,
                      ),
                    ],
                  ),

                  const CircleLayer(),
                  PolygonLayer(),

                  */
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

    facilityList.forEach((element) {
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
    for (var i = 0; i < facilityList.length; i++) {
      markerList.add(
        Marker(
          point: LatLng(
            facilityList[i].latitude.toDouble(),
            facilityList[i].longitude.toDouble(),
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
}
