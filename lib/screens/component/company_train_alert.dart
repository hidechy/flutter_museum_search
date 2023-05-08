// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../state/station/company_train/company_train_notifier.dart';
import '../../state/station/train_station/train_station_notifier.dart';
import '../station_name_search_screen.dart';
import 'museum_search_dialog.dart';
import 'train_station_alert.dart';

class CompanyTrainAlert extends ConsumerWidget {
  CompanyTrainAlert({super.key});

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final trainStationList =
        ref.watch(allStationProvider.select((value) => value.trainStationList));

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(width: context.screenSize.width),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  GestureDetector(
                    onTap: () {
                      // MuseumSearchDialog(
                      //   context: context,
                      //   widget: StationNameSearchAlert(
                      //     trainStationList: trainStationList,
                      //   ),
                      // );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StationNameSearchScreen(
                            trainStationList: trainStationList,
                          ),
                        ),
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
                        '駅名で検索する',
                        style: TextStyle(fontSize: 8, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(child: displayCompanyTrainList()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget displayCompanyTrainList() {
    final list = <Widget>[];

    final companyTrainState = _ref.watch(companyTrainProvider);

    companyTrainState.companyTrainList.forEach((element) {
      list.add(
        ExpansionTile(
          backgroundColor: Colors.white.withOpacity(0.1),
          title: Text(
            element.companyName,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          children: element.train.map((e) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    e.trainName,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  IconButton(
                    onPressed: () {
                      MuseumSearchDialog(
                        context: _context,
                        widget: TrainStationAlert(
                          companyNumber: element.companyId,
                          trainNumber: e.trainNumber,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      );
    });

    return SingleChildScrollView(
      child: Theme(
        data: ThemeData(
          canvasColor: Colors.black.withOpacity(0.3),
        ),
        child: Column(children: list),
      ),
    );
  }
}
