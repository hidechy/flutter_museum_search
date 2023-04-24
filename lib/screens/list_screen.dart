// ignore_for_file: cascade_invocations

import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:museum_search/models/station.dart';

import '../extensions/extensions.dart';
import '../models/art_facility.dart';
import '../state/app_param/app_param_notifier.dart';
import '../state/art_facility/art_facility_notifier.dart';
import '../state/lat_lng/lat_lng_notifier.dart';
import '../state/lat_lng_address/lat_lng_address_notifier.dart';
import '../state/lat_lng_address/lat_lng_address_request_state.dart';
import '../state/station/station_notifier.dart';
import 'component/facility_card.dart';
import 'component/museum_search_dialog.dart';
import 'flutter_map_screen.dart';
import 'map_screen.dart';
import 'route_list_screen.dart';

class ListScreen extends ConsumerStatefulWidget {
  const ListScreen({super.key});

  @override
  ConsumerState<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends ConsumerState<ListScreen> {
  List<DragAndDropItem> selectedArtFacilities = [];
  List<DragAndDropList> ddList = [];

  List<int> defaultIdList = [];
  List<int> orderedIdList = [];

  List<Facility> mapParamFacility = [];

  ///
  @override
  Widget build(BuildContext context) {
    makeDefault();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Routing Order'),
        leading: IconButton(
          onPressed: () async {
            await ref
                .watch(appParamProvider.notifier)
                .clearSelectedRouteNumber();

            routesButtonTap();
          },
          icon: const Icon(Icons.stacked_line_chart),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              umeButtonClick();
            },
            child: const CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.indigo,
              child: Text('梅'),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () async {
              await ref
                  .watch(appParamProvider.notifier)
                  .clearSelectedRouteNumber();

              takeButtonClick();
            },
            child: const CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.indigo,
              child: Text('竹'),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.close),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          getDefaultPointWidget(),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: DragAndDropLists(
                children: ddList,
                onItemReorder: itemReorder,
                onListReorder: listReorder,

                ///
                itemDecorationWhileDragging: const BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(color: Colors.white, blurRadius: 4),
                  ],
                ),

                ///
                lastListTargetSize: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///
  Widget getDefaultPointWidget() {
    final latLngState = ref.watch(latLngProvider);

    final latLngAddressState = ref.watch(latLngAddressProvider(
      const LatLngAddressRequestState(),
    ));

    final appParamState = ref.watch(appParamProvider);

    final stationState = ref.watch(stationProvider);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.1),
          ),
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '現在地点',
                      style: TextStyle(color: Colors.yellowAccent),
                    ),
                    Text('${latLngState.lat} / ${latLngState.lng}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        '${latLngAddressState.city}${latLngAddressState.town}',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ref.watch(appParamProvider.notifier).setBaseInclude(
                            baseInclude:
                                (appParamState.baseInclude == 1) ? 0 : 1);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.1),
                        ),
                        child: Text(
                          (appParamState.baseInclude == 1)
                              ? '駅または現在地点を含む'
                              : '駅または現在地点を含まない',
                          style: TextStyle(
                            fontSize: 8,
                            color: (appParamState.baseInclude == 1)
                                ? Colors.yellowAccent
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: context.screenSize.width,
          decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.2)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: stationState.stationList.map((e) {
                return GestureDetector(
                  onTap: () {
                    ref
                        .watch(appParamProvider.notifier)
                        .setSelectedStationId(ssi: e.id.toString());
                  },
                  child: Container(
                    margin: const EdgeInsets.all(3),
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                      color:
                          (appParamState.selectedStationId == e.id.toString())
                              ? Colors.yellowAccent.withOpacity(0.2)
                              : Colors.transparent,
                    ),
                    child: Column(
                      children: [
                        Text(e.stationName),
                        Text(
                          '${e.lat} / ${e.lng}',
                          style: const TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            const Text(
              '駅を選択した場合は現在地点よりも駅を優先します。',
              style: TextStyle(fontSize: 8),
            ),
          ],
        ),
      ],
    );
  }

  ///
  void makeDefault() {
    defaultIdList = [];
    ddList = [];

    final list = <Facility>[];

    final artFacilityState = ref.watch(artFacilityProvider);

    artFacilityState.selectIdList.forEach((element) {
      list.add(artFacilityState.facilityMap[element]!);
    });

    final saf = <DragAndDropItem>[];

    list.forEach((element) {
      saf.add(
        DragAndDropItem(
          child: FacilityCard(
            key: Key(element.id.toString()),
            dist: element.dist,
            latitude: element.latitude,
            longitude: element.longitude,
            name: element.name,
            genre: element.genre,
            address: element.address,
            displayDragIndicator: true,
          ),
        ),
      );

      defaultIdList.add(element.id);
    });

    ddList.add(DragAndDropList(children: saf));
  }

  ///
  void itemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      final movedItem = ddList[oldListIndex].children.removeAt(oldItemIndex);

      ddList[newListIndex].children.insert(newItemIndex, movedItem);
    });

    settingReorderIds();
  }

  ///
  void listReorder(int oldListIndex, int newListIndex) {}

  ///
  void settingReorderIds() {
    orderedIdList = [];

    for (final value in ddList) {
      for (final child in value.children) {
        orderedIdList.add(child.child.key
            .toString()
            .replaceAll('[', '')
            .replaceAll('<', '')
            .replaceAll("'", '')
            .replaceAll('>', '')
            .replaceAll(']', '')
            .toInt());
      }
    }
  }

  ///
  void routesButtonTap() {
    makeMapParamFacility();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen(facilityList: mapParamFacility),
      ),
    );
  }

  ///
  void takeButtonClick() {
    makeMapParamFacility();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlutterMapScreen(facilityList: mapParamFacility),
      ),
    );
  }

  ///
  void umeButtonClick() {
    makeMapParamFacility();

    MuseumSearchDialog(
      context: context,
      widget: RouteListScreen(facilityList: mapParamFacility),
    );
  }

  ///
  void makeMapParamFacility() {
    mapParamFacility = [];

    ///////////////////////////////////////////////////////////
    final appParamState = ref.watch(appParamProvider);

    final baseInclude =
        ref.watch(appParamProvider.select((value) => value.baseInclude));

    if (appParamState.selectedStationId != '') {
      final stationState = ref.watch(stationProvider);

      var selectedStation = Station(
        id: 0,
        stationName: '',
        address: '',
        lat: '',
        lng: '',
      );

      stationState.stationList.forEach((element) {
        if (element.id.toString() == appParamState.selectedStationId) {
          selectedStation = element;
        }
      });

      mapParamFacility.add(
        Facility(
          id: 0,
          name: '${selectedStation.stationName}駅',
          genre: '',
          address: selectedStation.address,
          latitude: selectedStation.lat,
          longitude: selectedStation.lng,
          dist: '0',
        ),
      );
    } else if (baseInclude == 1) {
      final latLngState = ref.watch(latLngProvider);

      final latLngAddressState = ref.watch(latLngAddressProvider(
        const LatLngAddressRequestState(),
      ));

      mapParamFacility.add(Facility(
        id: 0,
        name: '現在地点',
        genre: '',
        address: '${latLngAddressState.city}${latLngAddressState.town}',
        latitude: latLngState.lat.toString(),
        longitude: latLngState.lng.toString(),
        dist: '0',
      ));
    }
    ///////////////////////////////////////////////////////////

    final idList = (orderedIdList.isEmpty) ? defaultIdList : orderedIdList;

    final facilityMap =
        ref.read(artFacilityProvider.select((value) => value.facilityMap));

    idList.forEach((element) {
      mapParamFacility.add(facilityMap[element]!);
    });
  }
}
