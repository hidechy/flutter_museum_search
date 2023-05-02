// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:museum_search/state/app_param/app_param_notifier.dart';

import '../../extensions/extensions.dart';
import '../../state/station/company_train/company_train_notifier.dart';
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

    final appParamState = _ref.watch(appParamProvider);

    final companyTrainState = _ref.watch(companyTrainProvider);

    companyTrainState.companyTrainList.forEach((element) {
      list.add(
        ExpansionTile(
          backgroundColor: Colors.white.withOpacity(0.1),
          title: Text(
            element.companyName,
            style: TextStyle(
                color:
                    (appParamState.selectedTrainCompanyId == element.companyId)
                        ? Colors.yellowAccent
                        : Colors.white,
                fontSize: 12),
          ),
          children: element.train.map((e) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    e.trainName,
                    style: TextStyle(
                        color: (appParamState.selectedCompanyTrainId ==
                                e.trainNumber)
                            ? Colors.yellowAccent
                            : Colors.white,
                        fontSize: 10),
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
