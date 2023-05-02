// ignore_for_file: depend_on_referenced_packages, must_be_immutable, inference_failure_on_collection_literal, use_build_context_synchronously, unrelated_type_equality_checks, avoid_dynamic_calls

import 'dart:math';

import 'package:flutter/material.dart';

//import 'package:flutter_dotenv/flutter_dotenv.dart';
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
import '../state/select_route/select_route_notifier.dart';

//import '../state/station/station_notifier.dart';
import '../utility/functions/get_start_goal_data.dart';
import '../utility/utility.dart';
import 'component/company_train_alert.dart';
import 'component/museum_search_dialog.dart';
import 'component/route_display_setting_alert.dart';

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

  List<String> selectedIds = [];

  late BuildContext _context;

  ///
  @override
  Widget build(BuildContext context) {
    _context = context;

    makeBounds();

    makeMarker();

    final selectRouteState = ref.watch(selectRouteProvider);

    selectedIds = selectRouteState.selectedIds;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: showUnderMenu,
                  child: const Text('show detail'),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (selectRouteState.selectedIds.length <= 2) {
                          return;
                        }

                        //-----------------------------------------
                        final reg = RegExp('start_(.+)');
                        final reg2 = RegExp('goal_(.+)');

                        var flag1 = 0;
                        var flag2 = 0;
                        selectRouteState.selectedIds.forEach((element) {
                          final match = reg.firstMatch(element);
                          if (match != null) {
                            flag1 = 1;
                          }

                          final match2 = reg2.firstMatch(element);
                          if (match2 != null) {
                            flag2 = 1;
                          }
                        });

                        if (flag1 == 1 && flag2 == 1) {
                          ref
                              .watch(selectRouteProvider.notifier)
                              .setStartGoalBothSelect();
                        }
                        //-----------------------------------------

                        MuseumSearchDialog(
                          context: context,
                          widget: RouteDisplaySettingAlert(),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: (selectRouteState.selectedIds.length > 2)
                              ? Colors.blueAccent.withOpacity(0.4)
                              : Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '選択ルート確認',
                          style: TextStyle(
                            fontSize: 8,
                            color: (selectRouteState.selectedIds.length > 2)
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        ref
                            .watch(selectRouteProvider.notifier)
                            .clearSelectedId();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: (selectRouteState.selectedIds.length > 2)
                              ? Colors.blueAccent.withOpacity(0.4)
                              : Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '選択ルート消去',
                          style: TextStyle(
                            fontSize: 8,
                            color: (selectRouteState.selectedIds.length > 2)
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            displayStartGoal(),
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
  Widget displayStartGoal() {
    final selectRouteState = ref.watch(selectRouteProvider);

    /////////

    final appParamState = ref.watch(appParamProvider);
    if (appParamState != '') {}

    //--------------------------//
    var startInclude = false;
    var goalInclude = false;

    final reg = RegExp('start_(.+)');
    final reg2 = RegExp('goal_(.+)');

    selectRouteState.selectedIds.forEach((element) {
      final match = reg.firstMatch(element);
      if (match != null) {
        startInclude = true;
      }

      final match2 = reg2.firstMatch(element);
      if (match2 != null) {
        goalInclude = true;
      }
    });

    //----------------------------------------------------//
    Widget startParts = Container();

    if (startInclude) {
      final firstId = selectRouteState.selectedIds.first;
      final fId = firstId.replaceAll('start_', '');
      final firstItem = getStartGoalData(ref: ref, id: fId.toInt());

      startParts = Text(
        '開始位置：${firstItem.name}',
        style: const TextStyle(fontSize: 8),
      );
    }
    //----------------------------------------------------//

    //----------------------------------------------------//
    Widget goalParts = Container();

    if (goalInclude) {
      final lastId = selectRouteState.selectedIds.last;
      final lId = lastId.replaceAll('goal_', '');
      final lastItem = getStartGoalData(ref: ref, id: lId.toInt());

      goalParts = Text(
        '終了位置：${lastItem.name}',
        style: const TextStyle(fontSize: 8),
      );
    }
    //----------------------------------------------------//

    return Container(
      width: context.screenSize.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (startInclude) startParts,
          if (goalInclude) goalParts,
        ],
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

    for (var i = 0; i < widget.facilityList.length; i++) {
      markerList.add(
        Marker(
          point: LatLng(
            widget.facilityList[i].latitude.toDouble(),
            widget.facilityList[i].longitude.toDouble(),
          ),
          builder: (context) {
            return CircleAvatar(
              backgroundColor: getCircleAvatarBgColor(index: i),
              child: Text(
                getCircleAvatarText(index: i),
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

    //----------------------------------------

    final trainStationId = ref.watch(
      appParamProvider.select(
        (value) => value.selectedTrainStationId,
      ),
    );

    if (trainStationId != '') {
      final selectRouteState = ref.watch(selectRouteProvider);

      if (selectRouteState.selectedIds.length > 2) {
        final lastId = selectRouteState.selectedIds.last;
        final lId = lastId.replaceAll('goal_', '');
        final lastItem = getStartGoalData(ref: ref, id: lId.toInt());

        markerList.add(
          Marker(
            point: LatLng(
              lastItem.latitude.toDouble(),
              lastItem.longitude.toDouble(),
            ),
            builder: (context) {
              return CircleAvatar(
                backgroundColor: Colors.green.withOpacity(0.6),
                child: const Text(
                  'Goal',
                  style: TextStyle(
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

  ///
  Color getCircleAvatarBgColor({required int index}) {
    var color = Colors.transparent;

    final selectedRouteNumber = ref
        .watch(appParamProvider.select((value) => value.selectedRouteNumber));

    final baseInclude =
        ref.watch(appParamProvider.select((value) => value.baseInclude));

    if (baseInclude == 1) {
      if (index == 0) {
        color = (selectedRouteNumber == '0')
            ? Colors.redAccent.withOpacity(0.6)
            : Colors.indigo.withOpacity(0.6);
      } else {
        color = (index.toString() == selectedRouteNumber)
            ? Colors.redAccent.withOpacity(0.6)
            : Colors.black.withOpacity(0.6);
      }
    } else {
      color = (index.toString() == selectedRouteNumber)
          ? Colors.redAccent.withOpacity(0.6)
          : Colors.black.withOpacity(0.6);
    }

    //-------------------------

    final selectedIds =
        ref.watch(selectRouteProvider.select((value) => value.selectedIds));

    final ids = [];
    selectedIds.forEach((element) {
      ids.add(element.replaceAll('start_', '').replaceAll('goal_', ''));
    });

    if (ids.contains(widget.facilityList[index].id.toString())) {
      color = Colors.deepOrangeAccent;
    }

    //-------------------------

    final reg = RegExp('start_(.+)');
    final reg2 = RegExp('goal_(.+)');

    // TODO start、goal両方が選ばれた場合は緑色にする
    if (index == 0) {
      selectedIds.forEach((element2) {
        final match2 = reg2.firstMatch(element2);

        if (match2 != null) {
          selectedIds.forEach((element) {
            final match = reg.firstMatch(element);

            if (match != null) {
              color = Colors.green.withOpacity(0.6);
            }
          });
        }
      });
    }

    return color;
  }

  ///
  String getCircleAvatarText({required int index}) {
    final baseInclude =
        ref.watch(appParamProvider.select((value) => value.baseInclude));

    final selectedStationId =
        ref.watch(appParamProvider.select((value) => value.selectedStationId));

    if (baseInclude == 1) {
      return (index == 0)
          ? (selectedStationId != '')
              ? 'Sta'
              : 'Here'
          : index.toString();
    } else {
      return (index + 1).toString();
    }
  }

  ///
  Future<void> makePolyline() async {
    polylineList = [];

    /*
    final selectedRouteNumber = ref
        .watch(appParamProvider.select((value) => value.selectedRouteNumber));

    final accessToken = dotenv.get('MAPBOX_ACCESS_TOKEN');

    for (var i = 0; i < widget.facilityList.length - 1; i++) {
      final result = await mapboxpolylinePoints.getRouteBetweenCoordinates(
        accessToken,
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
*/

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
                    DefaultTextStyle(
                      style: const TextStyle(fontSize: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: displayBottomSheetContent(),
                      ),
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
      final facility = widget.facilityList[i];

      var distance = '';
      if (i < widget.facilityList.length - 1) {
        if ((facility.latitude == widget.facilityList[i + 1].latitude) &&
            (facility.longitude == widget.facilityList[i + 1].longitude)) {
          //TODO 緯度経度が同じ場合
          distance = '0';
        } else {
          distance = utility.calcDistance(
            originLat: facility.latitude.toDouble(),
            originLng: facility.longitude.toDouble(),
            destLat: widget.facilityList[i + 1].latitude.toDouble(),
            destLng: widget.facilityList[i + 1].longitude.toDouble(),
          );
        }
      }

      final ll = [facility.latitude, facility.longitude];

      list.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: getBottomSheetCircleAvatarBgColor(index: i),
                  foregroundColor: Colors.white,
                  child: getBottomSheetCircleAvatarText(index: i),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(facility.name),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(facility.address),
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
                padding: const EdgeInsets.only(top: 10, left: 20),
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
                              // IconButton(
                              //   onPressed: () async {
                              //     await ref
                              //         .watch(appParamProvider.notifier)
                              //         .setSelectedRouteNumber(
                              //             selectedRouteNumber: i.toString());
                              //
                              //     await makePolyline();
                              //   },
                              //   icon: const Icon(Icons.stacked_line_chart,
                              //       size: 20),
                              // ),
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
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.only(left: 70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (i == 0) {
                        await ref
                            .watch(selectRouteProvider.notifier)
                            .setSelectedId(
                              id: 'start_${facility.id}',
                            );

                        makeMarker();
                      } else {
                        await ref
                            .watch(selectRouteProvider.notifier)
                            .setSelectedId(id: facility.id.toString());
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text((i == 0) ? 'start' : 'select'),
                    ),
                  ),
                  if (i == 0) ...[
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (selectedIds.length < 2) {
                              utility.showErrorMessage(
                                context: context,
                                message: '終了地点は2点選択後にのみ設定可能です。',
                                ms: 2000,
                              );

                              return;
                            }

                            await ref
                                .watch(selectRouteProvider.notifier)
                                .setSelectedId(
                                  id: 'goal_${facility.id}',
                                );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text('goal'),
                          ),
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            if (selectedIds.length < 2) {
                              utility.showErrorMessage(
                                context: context,
                                message: '終了地点は2点選択後にのみ設定可能です。',
                                ms: 2000,
                              );

                              return;
                            }

                            MuseumSearchDialog(
                              context: context,
                              widget: CompanyTrainAlert(),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              '終了駅追加',
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
    }

    return list;
  }

  ///
  Color getBottomSheetCircleAvatarBgColor({required int index}) {
    final baseInclude =
        ref.watch(appParamProvider.select((value) => value.baseInclude));

    if (baseInclude == 1) {
      return (index == 0)
          ? Colors.indigo.withOpacity(0.6)
          : Colors.black.withOpacity(0.4);
    } else {
      return Colors.black.withOpacity(0.4);
    }
  }

  ///
  Text getBottomSheetCircleAvatarText({required int index}) {
    final baseInclude =
        ref.watch(appParamProvider.select((value) => value.baseInclude));

    final selectedStationId =
        ref.watch(appParamProvider.select((value) => value.selectedStationId));

    if (baseInclude == 1) {
      return (index == 0)
          ? Text(
              (selectedStationId != '') ? 'Sta' : 'Here',
              style: const TextStyle(fontSize: 10),
            )
          : Text(index.toString());
    } else {
      return Text((index + 1).toString());
    }
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
