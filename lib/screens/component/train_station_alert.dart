// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:museum_search/state/app_param/app_param_notifier.dart';
import 'package:museum_search/state/select_route/select_route_notifier.dart';

import '../../extensions/extensions.dart';
import '../../state/station/train_station/train_station_notifier.dart';

class TrainStationAlert extends ConsumerWidget {
  TrainStationAlert(
      {super.key, required this.companyNumber, required this.trainNumber});

  final int companyNumber;
  final String trainNumber;

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

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
              Expanded(child: displayStationSelectList()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget displayStationSelectList() {
    final list = <Widget>[];

    final trainStationState = _ref.watch(trainStationProvider(trainNumber));

    trainStationState.trainStationList.forEach((element) {
      list.add(
        GestureDetector(
          onTap: () {
            _ref
                .watch(selectRouteProvider.notifier)
                .setSelectedId(id: 'goal_${element.id}');

            _ref
                .watch(appParamProvider.notifier)
                .setSelectedCompanyTrainStation(
                  trainCompanyId: companyNumber,
                  companyTrainId: trainNumber,
                  trainStationId: element.id,
                );

            Navigator.pop(_context);
            Navigator.pop(_context);
          },
          child: Container(
            width: _context.screenSize.width,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(0.4),
              ),
            ),
            child: Text(
              element.stationName,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    });

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      ),
    );
  }
}
