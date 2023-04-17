// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../models/city.dart';
import '../../models/prefecture.dart';
import '../../utility/utility.dart';
import '../genre/genre_notifier.dart';
import '../prefecture/prefecture_notifier.dart';
import 'city_state.dart';

////////////////////////////////////////////////

// TODO autoDisposeを外している
final cityProvider = StateNotifierProvider<CityNotifier, CityState>((ref) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  final prefList =
      ref.watch(prefectureProvider.select((value) => value.prefList));

  return CityNotifier(const CityState(), client, utility, prefList, ref: ref);
});

class CityNotifier extends StateNotifier<CityState> {
  CityNotifier(super.state, this.client, this.utility, this.prefList,
      {required this.ref});

  final HttpClient client;
  final Utility utility;
  final List<PrefectureData> prefList;

  final StateNotifierProviderRef<CityNotifier, CityState> ref;

  ///
  @override
  void dispose() => super.dispose();

  ///
  Future<void> getCity({required PrefectureData pref}) async {
    await client.post(
      path: APIPath.getArtCity,
      body: {
        'prefCode': pref.prefCode,
        'prefecture': pref.prefName,
      },
    ).then((value) {
      final list = <CityData>[
        CityData(
          prefCode: 0,
          cityCode: '',
          cityName: '',
          bigCityFlag: '',
          count: 0,
        ),
      ];

      Map<String, CityData> cityMap = {};

      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        if (value['data'][i]['count'].toString().toInt() == 0) {
          continue;
        }

        list.add(
          CityData.fromJson(value['data'][i] as Map<String, dynamic>),
        );

        cityMap[value['data'][i]['cityCode'].toString()] =
            CityData.fromJson(value['data'][i] as Map<String, dynamic>);
      }

      state = state.copyWith(
        cityList: list,
        cityMap: cityMap,
      );
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }

  ///
  Future<void> selectCity({required String cityCode}) async {
    ////////////////////////////////////////////////
    final cityList = [...state.cityList];

    var cityName = '';
    var prefCode = 0;

    cityList.forEach((element) {
      if (element.cityCode == cityCode) {
        cityName = element.cityName;
        prefCode = element.prefCode;
      }
    });
    ////////////////////////////////////////////////

    ////////////////////////////////////////////////
    var prefName = '';
    prefList.forEach((element) {
      if (element.prefCode == prefCode) {
        prefName = element.prefName;
      }
    });
    ////////////////////////////////////////////////

    await ref
        .watch(genreProvider.notifier)
        .getGenre(prefName: prefName, cityName: cityName);

    state = state.copyWith(selectCityCode: cityCode);
  }

  ///
  Future<void> clearCity() async => state = state.copyWith(selectCityCode: '');

  ///
  Future<void> clearCityList() async => state = state.copyWith(cityList: []);
}

////////////////////////////////////////////////
