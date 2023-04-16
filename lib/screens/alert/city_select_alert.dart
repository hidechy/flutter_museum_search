// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/prefecture.dart';
import '../../state/city/city_notifier.dart';
import '../../state/prefecture/prefecture_notifier.dart';

class CitySelectAlert extends ConsumerWidget {
  CitySelectAlert({super.key});

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
              Expanded(child: displayCity()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget displayCity() {
    final list = <Widget>[];

    final prefectureState = _ref.watch(prefectureProvider);

    var selectPref = Pref(prefCode: 0, prefName: '');

    prefectureState.prefList.forEach((element) {
      if (element.prefCode == prefectureState.selectPrefCode) {
        selectPref = element;
      }
    });

    final cityState = _ref.watch(cityProvider(selectPref));

    cityState.cityList.forEach((element) {
      list.add(
        cityTextButton(
          cityCode: element.cityCode,
          cityName: element.cityName,
          count: element.count,
          selectPref: selectPref,
        ),
      );
    });

    /*


      int prefCode;
  String cityCode;
  String cityName;
  String bigCityFlag;
  int count;


    */

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      ),
    );
  }

  ///
  Widget cityTextButton(
      {required String cityCode,
      required String cityName,
      required int count,
      required Pref selectPref}) {
    return Container(
      width: _context.screenSize.width,
      padding: const EdgeInsets.only(bottom: 20),
      child: (count > 0)
          ? GestureDetector(
              onTap: () {
                _ref
                    .watch(cityProvider(selectPref).notifier)
                    .selectCity(cityCode: cityCode, cityName: cityName);
              },
              child: Text('$cityName（$count）'),
            )
          : Text(
              '$cityName（$count）',
              style: const TextStyle(color: Colors.grey),
            ),
    );
  }
}
