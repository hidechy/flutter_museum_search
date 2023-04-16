// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:museum_search/extensions/extensions.dart';
import 'package:museum_search/models/city.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../utility/utility.dart';
import 'city_state.dart';

////////////////////////////////////////////////
final cityProvider =
    StateNotifierProvider.autoDispose<CityNotifier, CityState>((ref) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  return CityNotifier(const CityState(), client, utility);
});

class CityNotifier extends StateNotifier<CityState> {
  CityNotifier(super.state, this.client, this.utility);

  final HttpClient client;
  final Utility utility;

  ///
  Future<void> getCity(
      {required int prefCode, required String prefecture}) async {
    await client.post(
      path: APIPath.getArtCity,
      body: {'prefCode': prefCode, 'prefecture': prefecture},
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
}

////////////////////////////////////////////////
