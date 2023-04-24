// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:museum_search/state/station/station_response_state.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../models/station.dart';
import '../../utility/utility.dart';
import 'station_request_state.dart';

////////////////////////////////////////////////
final stationProvider =
    StateNotifierProvider.autoDispose<StationNotifier, StationResponseState>(
        (ref) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  return StationNotifier(const StationResponseState(), client, utility);
});

class StationNotifier extends StateNotifier<StationResponseState> {
  StationNotifier(super.state, this.client, this.utility);

  final HttpClient client;
  final Utility utility;

  Future<void> getStation({required StationRequestState param}) async {
    final uploadData = <String, dynamic>{};

    uploadData['searchStation'] = param.facilityLatLng;

    await client
        .post(path: APIPath.getNearStation, body: uploadData)
        .then((value) {
      final list = <Station>[];

      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        list.add(Station.fromJson(value['data'][i] as Map<String, dynamic>));
      }

      state = state.copyWith(stationList: list);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}

////////////////////////////////////////////////
