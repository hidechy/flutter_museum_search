// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../models/train_station.dart';

class StationNameSearchScreen extends StatelessWidget {
  const StationNameSearchScreen({super.key, required this.trainStationList});

  final List<Station> trainStationList;

  ///
  static String _displayStringForOption(Station station) {
    return station.stationName;
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                          style: TextStyle(fontSize: 12),
                        ),
                        subtitle: Text(
                          stationList[index].lineName,
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            print(stationList[index].stationName);

                            Navigator.pop(context);
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
