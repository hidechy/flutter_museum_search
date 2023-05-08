// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/train_station.dart';

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
            const SizedBox(height: 20),
            Autocomplete<Station>(
                displayStringForOption: _displayStringForOption,
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<Station>.empty();
                  }

                  return trainStationList.where((Station station) {
                    return station.stationName.contains(textEditingValue.text);
                  });
                },
                optionsViewBuilder: (context, onSelected, trainStationList) {
                  return ListView.builder(
                      itemCount: trainStationList.length,
                      itemBuilder: (context, index) {
                        final stationList = trainStationList.toList();

                        return StationNameCard(stationList[index]);
                      });
                }),
          ],
        ),
      ),
    );
  }
}

class StationNameCard extends StatelessWidget {
  StationNameCard(this.station, {super.key});

  Station station;

  ///
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(station.stationName),
        subtitle: Text(station.lineName),
        onTap: () {
          print(station.stationName);

          Navigator.pop(context);
        },
      ),
    );
  }
}
