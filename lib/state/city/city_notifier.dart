// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../models/city.dart';
import '../../models/prefecture.dart';
import '../../utility/utility.dart';
import 'city_state.dart';

////////////////////////////////////////////////

// TODO autoDisposeを外している
final cityProvider = StateNotifierProvider<CityNotifier, CityState>((ref) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  return CityNotifier(const CityState(), client, utility);
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
      final list = <CityData>[
        CityData(
          prefCode: 0,
          cityCode: '',
          cityName: '',
          bigCityFlag: '',
          count: 0,
        ),
      ];

      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        if (value['data'][i]['count'].toString().toInt() == 0) {
          continue;
        }

        list.add(
          CityData.fromJson(value['data'][i] as Map<String, dynamic>),
        );
      }

      state = state.copyWith(cityList: list);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }

  ///
  Future<void> selectCity({required String cityCode}) async {
    state = state.copyWith(selectCityCode: cityCode);
  }

  ///
  Future<void> clearCity() async {
    state = state.copyWith(selectCityCode: '');
  }
}

////////////////////////////////////////////////
