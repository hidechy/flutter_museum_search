// ignore_for_file: must_be_immutable, use_build_context_synchronously, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:museum_search/screens/alert/city_select_alert.dart';
import 'package:museum_search/screens/alert/museum_search_dialog.dart';
import 'package:museum_search/state/app_param/app_param_notifier.dart';
import 'package:museum_search/state/city/city_notifier.dart';
import 'package:museum_search/state/city/city_state.dart';

import '../extensions/extensions.dart';
import '../models/prefecture.dart';
import '../state/art_facility/art_facility_notifier.dart';

import '../state/lat_lng/lat_lng_notifier.dart';
import '../state/lat_lng/lat_lng_request_state.dart';

import '../state/prefecture/prefecture_notifier.dart';
import 'map_screen.dart';

//
//
// import '../state/genre/genre_notifier.dart';
// import '../state/prefecture/prefecture_notifier.dart';
//
//

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final appParamState = ref.watch(appParamProvider);

    //
    //
    //
    // final selectPref = ref.watch(
    //   prefectureProvider.select((value) => value.selectPref),
    // );
    //
    // final selectGenre = ref.watch(
    //   genreProvider.select((value) => value.selectGenre),
    // );
    //
    //
    //

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () async {
                  await setSearchFlagFalse();

                  await ref
                      .read(appParamProvider.notifier)
                      .setSearchDisp(searchDisp: !appParamState.searchDisp);
                },
                icon: (appParamState.searchDisp)
                    ? const Icon(Icons.arrow_drop_up_outlined)
                    : const Icon(Icons.arrow_drop_down_outlined),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      ref
                          .watch(appParamProvider.notifier)
                          .setSearchFlag(searchFlag: true);

                      //
                      //
                      //
                      // //---// 片方が空の場合、処理を中断する
                      // if ((selectPref != '' && selectGenre == '') ||
                      //     (selectPref == '' && selectGenre != '')) {
                      //   ref
                      //       .read(appParamProvider.notifier)
                      //       .setGenreSearchStop(genreSearchStop: true);
                      //
                      //   return;
                      // }
                      // //---// 片方が空の場合、処理を中断する
                      //
                      //
                      //

                      ref
                          .watch(artFacilityProvider.notifier)
                          .getArtFacilities();
                    },
                    icon: const Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.map),
                  ),
                ],
              ),
            ],
          ),
          const Divider(color: Colors.black, thickness: 2),
          if (appParamState.searchDisp) ...[
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

    final allList =
        _ref.watch(artFacilityProvider.select((value) => value.allList));

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
          if (allList.isNotEmpty) displayAllCheck(),
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
    final latLngState = _ref.watch(latLngProvider);

    //
    //
    //
    // final genreSearchStop =
    //     _ref.watch(appParamProvider.select((value) => value.genreSearchStop));
    //
    //
    //

    //------------------------//

    var cityState = const CityState();

    var selectPref = Pref(prefCode: 0, prefName: '');

    final prefectureState = _ref.watch(prefectureProvider);

    if (prefectureState.selectPrefCode != '') {
      prefectureState.prefList.forEach((element) {
        if (element.prefCode == prefectureState.selectPrefCode) {
          selectPref = element;
        }
      });

      cityState = _ref.watch(cityProvider(selectPref));
    }
    //------------------------//

    ///
    final prefDropDown = DropdownButton(
      dropdownColor: Colors.pinkAccent.withOpacity(0.1),
      iconEnabledColor: Colors.white,
      items: prefectureState.prefList.map((e) {
        return DropdownMenuItem(
          value: e.prefCode,
          child: Text(e.prefName),
        );
      }).toList(),
      value: prefectureState.selectPrefCode,
      onChanged: (value) async {
        await setSearchFlagFalse();

        await _ref
            .watch(prefectureProvider.notifier)
            .selectPref(prefCode: value!);

        await _ref.watch(cityProvider(selectPref).notifier).clearCity();

        await MuseumSearchDialog(
          context: _context,
          widget: CitySelectAlert(),
        );
      },
    );

    //
    // ///
    // final genreState = _ref.watch(genreProvider);
    // final genreDropDown = DropdownButton(
    //   dropdownColor: Colors.pinkAccent.withOpacity(0.1),
    //   iconEnabledColor: Colors.white,
    //   items: genreState.genreList.map((e) {
    //     return DropdownMenuItem(value: e, child: Text(e));
    //   }).toList(),
    //   value: genreState.selectGenre,
    //   onChanged: (value) async {
    //     await setSearchFlagFalse();
    //
    //     await _ref.watch(genreProvider.notifier).selectGenre(genre: value!);
    //   },
    // );
    //
    //
    //
    //
    //

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      await setSearchFlagFalse();

                      //
                      //
                      //
                      //
                      // await _ref.watch(prefectureProvider.notifier).clearPref();
                      //
                      // await _ref.watch(genreProvider.notifier).clearGenre();
                      //
                      //
                      //

                      await getLocation();
                    },
                    icon: const Icon(Icons.location_on),
                  ),
                  IconButton(
                    onPressed: () async {
                      await setSearchFlagFalse();

                      await _ref.watch(latLngProvider.notifier).clearLatLng();

                      //
                      //
                      //
                      // await _ref.watch(prefectureProvider.notifier).clearPref();
                      //
                      // await _ref.watch(genreProvider.notifier).clearGenre();
                      //
                      //
                      //
                    },
                    icon: const Icon(Icons.location_off),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(latLngState.lat.toString()),
                    const Text(' / '),
                    Text(latLngState.lng.toString()),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.2),
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  prefDropDown,
                  const SizedBox(width: 20),

                  Text(cityState.selectCityName),

                  // genreDropDown,
                  //
                  //
                  //
                ],
              ),
              Container(

                  //
                  //
                  //
                  //
                  // child: genreSearchStop
                  //     ? const Text(
                  //         '両方選択してください。',
                  //         style: TextStyle(
                  //           color: Colors.yellowAccent,
                  //           fontSize: 10,
                  //         ),
                  //       )
                  //     : const Text(''),
                  //
                  //
                  //
                  //

                  ),
            ],
          ),
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
}
