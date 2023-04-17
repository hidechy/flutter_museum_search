import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:museum_search/extensions/extensions.dart';

import '../models/art_facility.dart';
import 'component/facility_card.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key, required this.list});

  final List<Facility> list;

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<DragAndDropItem> selectedArtFacilities = [];
  List<DragAndDropList> ddList = [];

  List<int> orderList = [];

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
          ),
        ),
      );
    });

    ddList.add(DragAndDropList(children: selectedArtFacilities));
  }

  ///
  @override
  Widget build(BuildContext context) {
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
                  color: Colors.blueGrey,
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
    orderList = [];

    for (final value in ddList) {
      for (final child in value.children) {
        orderList.add(child.child.key
            .toString()
            .replaceAll('[', '')
            .replaceAll('<', '')
            .replaceAll("'", "")
            .replaceAll('>', '')
            .replaceAll(']', '')
            .toInt());
      }
    }
  }
}
