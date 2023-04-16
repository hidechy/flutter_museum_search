// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../models/city.dart';
import '../../models/prefecture.dart';
import '../../utility/utility.dart';
import '../app_param/app_param_notifier.dart';
import 'city_state.dart';

////////////////////////////////////////////////
final cityProvider = StateNotifierProvider.autoDispose
    .family<CityNotifier, CityState, Pref>((ref, pref) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  final appParamState = ref.watch(appParamProvider);

  if (appParamState.citySelectFlag) {
    return CityNotifier(const CityState(), client, utility);
  } else {
    return CityNotifier(const CityState(), client, utility)
      ..getCity(pref: pref);
  }
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
        list.add(
          CityData(
            prefCode: value['data'][i]['prefCode'].toString().toInt(),
            cityCode: value['data'][i]['cityCode'].toString(),
            cityName: value['data'][i]['cityName'].toString(),
            bigCityFlag: value['data'][i]['bigCityFlag'].toString(),
            count: value['data'][i]['count'].toString().toInt(),
          ),
        );
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
