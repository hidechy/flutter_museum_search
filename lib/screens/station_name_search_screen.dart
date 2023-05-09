// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/train_station.dart';
import '../state/app_param/app_param_notifier.dart';
import '../state/select_route/select_route_notifier.dart';

class StationNameSearchScreen extends ConsumerWidget {
  const StationNameSearchScreen({super.key, required this.trainStationList});

  final List<Station> trainStationList;

  ///
  static String _displayStringForOption(Station station) {
    return station.stationName;
  }

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 'only_close');
                    },
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
            ),

            /////

            Autocomplete<Station>(
              //

              displayStringForOption: _displayStringForOption,

              //

              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<Station>.empty();
                }

                return trainStationList.where((Station station) {
                  return station.stationName.contains(textEditingValue.text);
                });
              },

              //

              optionsViewBuilder: (context, onSelected, trainStationList) {
                return ListView.builder(
                  itemCount: trainStationList.length,
                  itemBuilder: (context, index) {
                    final stationList = trainStationList.toList();

                    return Card(
                      child: ListTile(
                        title: Text(
                          stationList[index].stationName,
                          style: const TextStyle(fontSize: 12),
                        ),
                        subtitle: Text(
                          stationList[index].lineName,
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            ref
                                .watch(selectRouteProvider.notifier)
                                .setSelectedId(
                                    id: 'goal_${stationList[index].id}');

                            ref
                                .watch(appParamProvider.notifier)
                                .setSelectedCompanyTrainStation(
                                  trainCompanyId: 0,
                                  companyTrainId:
                                      stationList[index].lineNumber.toString(),
                                  trainStationId: stationList[index].id,
                                );

                            Navigator.pop(context, 'station_set');
                          },
                          child: Icon(
                            Icons.input,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },

              //
            ),

            /////
          ],
        ),
      ),
    );
  }
}
