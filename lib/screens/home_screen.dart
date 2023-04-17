// ignore_for_file: must_be_immutable, use_build_context_synchronously, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../extensions/extensions.dart';
import '../state/app_param/app_param_notifier.dart';
import '../state/art_facility/art_facility_notifier.dart';
import '../state/city/city_notifier.dart';
import '../state/genre/genre_notifier.dart';
import '../state/lat_lng/lat_lng_notifier.dart';
import '../state/lat_lng/lat_lng_request_state.dart';
import '../state/prefecture/prefecture_notifier.dart';
import 'map_screen.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final latLngState = ref.watch(latLngProvider);

    final searchDisp =
        ref.watch(appParamProvider.select((value) => value.searchDisp));

    final selectPrefCode =
        ref.watch(prefectureProvider.select((value) => value.selectPrefCode));

    final selectCityCode =
        ref.watch(cityProvider.select((value) => value.selectCityCode));

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              //

              IconButton(
                onPressed: () async {
                  await setSearchFlagFalse();

                  await ref
                      .read(appParamProvider.notifier)
                      .setSearchDisp(searchDisp: !searchDisp);

                  await ref
                      .watch(genreProvider.notifier)
                      .getGenre(prefName: '', cityName: '');

                  await clearSearchArea();
                },
                icon: searchDisp
                    ? const Icon(
                        Icons.arrow_drop_up_outlined,
                        color: Colors.lightBlueAccent,
                      )
                    : const Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.lightBlueAccent,
                      ),
              ),

              //

              Expanded(
                child: Row(
                  children: [
                    (latLngState.lat == 0 || latLngState.lng == 0)
                        ? IconButton(
                            onPressed: () async {
                              await setSearchFlagFalse();

                              await getLocation();
                            },
                            icon: const Icon(Icons.location_on),
                          )
                        : IconButton(
                            onPressed: () async {
                              await setSearchFlagFalse();

                              await _ref
                                  .watch(latLngProvider.notifier)
                                  .clearLatLng();
                            },
                            icon: const Icon(Icons.location_off),
                          ),
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(latLngState.lat.toString()),
                          Text(latLngState.lng.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //

              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (latLngSettingCheck() == true) {
                        //都道府県選択時
                        if (selectPrefCode > 0) {
                          if (selectCityCode == '') {
                            ref
                                .watch(appParamProvider.notifier)
                                .setSearchErrorFlag(
                                  searchErrorMessage:
                                      '都道府県設定時は\n市区町村も\n入力してください。',
                                );

                            return;
                          }
                        } else {
                          if (latLngState.lat == 0 || latLngState.lng == 0) {
                            ref
                                .watch(appParamProvider.notifier)
                                .setSearchErrorFlag(
                                  searchErrorMessage:
                                      '都道府県または\n現在地点の座標を\n設定してください。',
                                );
                          }
                        }

                        ref
                            .watch(appParamProvider.notifier)
                            .setSearchFlag(searchFlag: true);

                        ref
                            .watch(artFacilityProvider.notifier)
                            .getArtFacilities();
                      }
                    },
                    icon: const Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {
                      if (latLngSettingCheck() == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapScreen(),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.map),
                  ),
                ],
              ),

              //
            ],
          ),
          const Divider(color: Colors.black, thickness: 2),
          if (searchDisp) ...[
            displaySearchBlock(),
            const Divider(color: Colors.black, thickness: 2),
          ],
          Expanded(child: dispArtFacilities()),
        ],
      ),
    );
  }

  ///
  Future<void> getLocation() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    // 現在の位置を返す
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // 北緯がプラス。南緯がマイナス
    debugPrint('緯度: ${position.latitude}');

    // 東経がプラス、西経がマイナス
    debugPrint('経度: ${position.longitude}');

    final param = LatLngRequestState(
      lat: position.latitude,
      lng: position.longitude,
    );

    await _ref.watch(latLngProvider.notifier).setLatLng(param: param);
  }

  ///
  Widget dispArtFacilities() {
    final artFacilityState = _ref.watch(artFacilityProvider);

    final list = <Widget>[];

    var tooManyFlag = false;

    artFacilityState.allList.forEach((element) {
      if (element.id == 99999999) {
        tooManyFlag = true;
      }

      list.add(
        Container(
          width: _context.screenSize.width,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: artFacilityState.selectIdList.contains(element.id),
                activeColor: Colors.yellowAccent.withOpacity(0.2),
                side: BorderSide(color: Colors.white.withOpacity(0.4)),
                onChanged: (value) {
                  _ref
                      .read(artFacilityProvider.notifier)
                      .onCheckboxChange(id: element.id);
                },
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          element.dist,
                          style: const TextStyle(color: Colors.yellowAccent),
                        ),
                        Text('${element.latitude} / ${element.longitude}'),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(element.name),
                          Text(element.genre),
                          Text(element.address),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });

    if (tooManyFlag) {
      return Container(
        width: _context.screenSize.width,
        padding: const EdgeInsets.only(left: 20),
        child: const Text(
          '結果が多すぎるため表示できません。',
          style: TextStyle(color: Colors.yellowAccent, fontSize: 12),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          if (artFacilityState.allList.isNotEmpty) displayAllCheck(),
          Column(children: list),
        ],
      ),
    );
  }

  ///
  Widget displayAllCheck() {
    final allList =
        _ref.watch(artFacilityProvider.select((value) => value.allList));

    final selectIdList =
        _ref.watch(artFacilityProvider.select((value) => value.selectIdList));

    return Container(
      width: _context.screenSize.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2),
        ),
      ),
      child: Row(
        children: [
          Checkbox(
            value: allList.length == selectIdList.length,
            activeColor: Colors.yellowAccent.withOpacity(0.2),
            side: BorderSide(color: Colors.white.withOpacity(0.4)),
            onChanged: (value) {
              _ref.watch(artFacilityProvider.notifier).onAllCheckChange();
            },
          ),
          Expanded(
            child: Text(
              '全て選択する（${allList.length}件）',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  ///
  Widget displaySearchBlock() {
    final prefectureState = _ref.watch(prefectureProvider);
    final cityState = _ref.watch(cityProvider);
    final genreState = _ref.watch(genreProvider);

    final appParamState = _ref.watch(appParamProvider);

    ///
    final prefDropDown = DropdownButton(
      dropdownColor: Colors.pinkAccent.withOpacity(0.1),
      iconEnabledColor: Colors.white,
      items: prefectureState.prefList.map((e) {
        return DropdownMenuItem(
          value: e.prefCode,
          child: Text(
            e.prefName,
            style: const TextStyle(fontSize: 12),
          ),
        );
      }).toList(),
      value: prefectureState.selectPrefCode,
      onChanged: (value) async {
        await setSearchFlagFalse();

        await _ref.watch(appParamProvider.notifier).clearSearchErrorFlag();

        await _ref
            .watch(prefectureProvider.notifier)
            .selectPref(prefCode: value!);
      },
    );

    ///
    final cityDropDown = DropdownButton(
      dropdownColor: Colors.pinkAccent.withOpacity(0.1),
      iconEnabledColor: Colors.white,
      items: cityState.cityList.map((e) {
        return DropdownMenuItem(
          value: e.cityCode,
          child: (e.cityName == '')
              ? Text(
                  e.cityName,
                  style: const TextStyle(fontSize: 12),
                )
              : Text(
                  '${e.cityName}（${e.count}）',
                  style: const TextStyle(fontSize: 12),
                ),
        );
      }).toList(),
      value: cityState.selectCityCode,
      onChanged: (value) async {
        await _ref.watch(cityProvider.notifier).selectCity(cityCode: value!);
      },
    );

    ///
    final genreDropDown = DropdownButton(
      dropdownColor: Colors.pinkAccent.withOpacity(0.1),
      iconEnabledColor: Colors.white,
      items: genreState.genreList.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(
            e,
            style: const TextStyle(fontSize: 12),
          ),
        );
      }).toList(),
      value: genreState.selectGenre,
      onChanged: (value) async {
        await _ref.watch(genreProvider.notifier).selectGenre(genre: value!);
      },
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  prefDropDown,
                  const SizedBox(width: 20),
                  cityDropDown,
                ],
              ),
              Container(
                child: (appParamState.searchErrorFlag)
                    ? Text(
                        appParamState.searchErrorMessage,
                        style: const TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 8,
                        ),
                      )
                    : const Text(''),
              ),
            ],
          ),
          genreDropDown,
        ],
      ),
    );
  }

  ///
  Future<void> setSearchFlagFalse() async {
    await _ref
        .watch(appParamProvider.notifier)
        .setSearchFlag(searchFlag: false);
  }

  ///
  Future<void> clearSearchArea() async {
    await _ref.watch(cityProvider.notifier).clearCityList();
    await _ref.watch(prefectureProvider.notifier).clearPref();
    await _ref.watch(genreProvider.notifier).clearGenre();
  }

  ///
  bool latLngSettingCheck() {
    final latLngState = _ref.watch(latLngProvider);

    if (latLngState.lat == 0 || latLngState.lng == 0) {
      ScaffoldMessenger.of(_context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.black,
          content: Text(
            '現在位置の座標が設定されていません。',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      );

      return false;
    }

    return true;
  }
}
