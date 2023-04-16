// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:museum_search/extensions/extensions.dart';
import 'package:museum_search/models/city.dart';
import 'package:museum_search/models/prefecture.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../utility/utility.dart';
import 'city_state.dart';

////////////////////////////////////////////////
final cityProvider = StateNotifierProvider.autoDispose
    .family<CityNotifier, CityState, Pref>((ref, pref) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  return CityNotifier(const CityState(), client, utility)..getCity(pref: pref);
});

class CityNotifier extends StateNotifier<CityState> {
  CityNotifier(super.state, this.client, this.utility);

  final HttpClient client;
  final Utility utility;

  ///
  Future<void> getCity({required Pref pref}) async {
    await client.post(
      path: APIPath.getArtCity,
      body: {
        'prefCode': pref.prefCode,
        'prefecture': pref.prefName,
      },
    ).then((value) {
      final list = <CityData>[];

      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        list.add(CityData.fromJson(value['data'][i] as Map<String, dynamic>));
      }

      state = state.copyWith(cityList: list);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }

  ///
  Future<void> selectCity(
      {required String cityCode, required String cityName}) async {
    state = state.copyWith(selectCityCode: cityCode, selectCityName: cityName);
  }

  ///
  Future<void> clearCity() async {
    state = state.copyWith(selectCityCode: '', selectCityName: '');
  }
}

////////////////////////////////////////////////
