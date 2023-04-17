import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:museum_search/state/lat_lng/lat_lng_notifier.dart';
import 'package:museum_search/state/lat_lng_address/lat_lng_address_notifier.dart';

import '../extensions/extensions.dart';
import '../models/art_facility.dart';
import 'component/facility_card.dart';

class ListScreen extends ConsumerStatefulWidget {
  const ListScreen({super.key, required this.list});

  final List<Facility> list;

  @override
  ConsumerState<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends ConsumerState<ListScreen> {
  List<DragAndDropItem> selectedArtFacilities = [];
  List<DragAndDropList> ddList = [];

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
            displayRoutesButton: true,
            routesButtonTap: () {
              routesButtonTap(id: element.id);
            },
            displayDragIndicator: true,
          ),
        ),
      );
    });

    ddList.add(DragAndDropList(children: selectedArtFacilities));
  }

  ///
  @override
  Widget build(BuildContext context) {
    final latLngState = ref.watch(latLngProvider);

    final latLngAddressState = ref.watch(latLngAddressProvider);

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
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
                        '現在地',
                        style: TextStyle(color: Colors.yellowAccent),
                      ),
                      Text('${latLngState.lat} / ${latLngState.lng}'),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      '${latLngAddressState.city}${latLngAddressState.town}',
                    ),
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
  void routesButtonTap({required int id}) {
    print(id);

    print(orderedIdList);
  }
}
