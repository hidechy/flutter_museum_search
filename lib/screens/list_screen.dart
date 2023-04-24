import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../extensions/extensions.dart';
import '../models/art_facility.dart';
import '../state/app_param/app_param_notifier.dart';
import '../state/art_facility/art_facility_notifier.dart';
import '../state/lat_lng/lat_lng_notifier.dart';
import '../state/lat_lng_address/lat_lng_address_notifier.dart';
import '../state/lat_lng_address/lat_lng_address_request_state.dart';
import 'component/facility_card.dart';
import 'component/museum_search_dialog.dart';
import 'flutter_map_screen.dart';
import 'map_screen.dart';
import 'route_list_screen.dart';

class ListScreen extends ConsumerStatefulWidget {
  const ListScreen({super.key, required this.list});

  final List<Facility> list;

  @override
  ConsumerState<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends ConsumerState<ListScreen> {
  List<DragAndDropItem> selectedArtFacilities = [];
  List<DragAndDropList> ddList = [];

  List<int> defaultIdList = [];
  List<int> orderedIdList = [];

  ///
  @override
  void initState() {
    super.initState();

    widget.list.forEach((element) {
      selectedArtFacilities.add(
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
    });

    ddList.add(DragAndDropList(children: selectedArtFacilities));

    makeDefaultIdList();
  }

  ///
  @override
  Widget build(BuildContext context) {
    final latLngState = ref.watch(latLngProvider);

    final latLngAddressState = ref.watch(latLngAddressProvider(
      const LatLngAddressRequestState(),
    ));

    final baseInclude =
        ref.watch(appParamProvider.select((value) => value.baseInclude));

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
                              baseInclude: (baseInclude == 1) ? 0 : 1);
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
                            (baseInclude == 1) ? '現在地点を含む' : '現在地点を含まない',
                            style: TextStyle(
                              fontSize: 8,
                              color: (baseInclude == 1)
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
  void makeDefaultIdList() {
    widget.list.forEach((element) {
      defaultIdList.add(element.id);
    });
  }

  ///
  void routesButtonTap() {
    final facilityMap =
        ref.read(artFacilityProvider.select((value) => value.facilityMap));

    final latLngState = ref.watch(latLngProvider);

    final latLngAddressState = ref.watch(latLngAddressProvider(
      const LatLngAddressRequestState(),
    ));

    final baseInclude =
        ref.watch(appParamProvider.select((value) => value.baseInclude));

    final idList = (orderedIdList.isEmpty) ? defaultIdList : orderedIdList;

    final facilityList = <Facility>[];

    if (baseInclude == 1) {
      facilityList.add(Facility(
        id: 0,
        name: '現在地点',
        genre: '',
        address: '${latLngAddressState.city}${latLngAddressState.town}',
        latitude: latLngState.lat.toString(),
        longitude: latLngState.lng.toString(),
        dist: '0',
      ));
    }

    idList.forEach((element) {
      facilityList.add(facilityMap[element]!);
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen(facilityList: facilityList),
      ),
    );
  }

  ///
  void takeButtonClick() {
    final facilityMap =
        ref.read(artFacilityProvider.select((value) => value.facilityMap));

    final latLngState = ref.watch(latLngProvider);

    final latLngAddressState = ref.watch(latLngAddressProvider(
      const LatLngAddressRequestState(),
    ));

    final baseInclude =
        ref.watch(appParamProvider.select((value) => value.baseInclude));

    final idList = (orderedIdList.isEmpty) ? defaultIdList : orderedIdList;

    final facilityList = <Facility>[];

    if (baseInclude == 1) {
      facilityList.add(Facility(
        id: 0,
        name: '現在地点',
        genre: '',
        address: '${latLngAddressState.city}${latLngAddressState.town}',
        latitude: latLngState.lat.toString(),
        longitude: latLngState.lng.toString(),
        dist: '0',
      ));
    }

    idList.forEach((element) {
      facilityList.add(facilityMap[element]!);
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlutterMapScreen(facilityList: facilityList),
      ),
    );
  }

  ///
  void umeButtonClick() {
    final facilityMap =
        ref.read(artFacilityProvider.select((value) => value.facilityMap));

    final latLngState = ref.watch(latLngProvider);

    final latLngAddressState = ref.watch(latLngAddressProvider(
      const LatLngAddressRequestState(),
    ));

    final baseInclude =
        ref.watch(appParamProvider.select((value) => value.baseInclude));

    final idList = (orderedIdList.isEmpty) ? defaultIdList : orderedIdList;

    final facilityList = <Facility>[];

    if (baseInclude == 1) {
      facilityList.add(Facility(
        id: 0,
        name: '現在地点',
        genre: '',
        address: '${latLngAddressState.city}${latLngAddressState.town}',
        latitude: latLngState.lat.toString(),
        longitude: latLngState.lng.toString(),
        dist: '0',
      ));
    }

    idList.forEach((element) {
      facilityList.add(facilityMap[element]!);
    });

    MuseumSearchDialog(
      context: context,
      widget: RouteListScreen(facilityList: facilityList),
    );
  }
}
