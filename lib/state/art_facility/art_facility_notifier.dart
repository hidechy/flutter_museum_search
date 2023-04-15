// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:museum_search/state/genre/genre_notifier.dart';
import 'package:museum_search/state/genre/genre_state.dart';
import 'package:museum_search/state/prefecture/prefecture_notifier.dart';
import 'package:museum_search/state/prefecture/prefecture_state.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../models/art_facility.dart';
import '../../utility/utility.dart';
import '../lat_lng/lat_lng_notifier.dart';
import '../lat_lng/lat_lng_response_state.dart';
import 'art_facility_result_state.dart';

////////////////////////////////////////////////
final artFacilityProvider = StateNotifierProvider.autoDispose<
    ArtFacilityNotifier, ArtFacilityResultState>((ref) {
  final client = ref.watch(httpClientProvider);

  final utility = Utility();

  final latLngState = ref.watch(latLngProvider);

  final prefectureState = ref.watch(prefectureProvider);

  final genreState = ref.watch(genreProvider);

  return ArtFacilityNotifier(
    const ArtFacilityResultState(),
    client,
    utility,
    latLngState,
    prefectureState,
    genreState,
  );
});

class ArtFacilityNotifier extends StateNotifier<ArtFacilityResultState> {
  ArtFacilityNotifier(super.state, this.client, this.utility, this.latLngState,
      this.prefectureState, this.genreState);

  final HttpClient client;
  final Utility utility;

  final LatLngResponseState latLngState;

  final PrefectureState prefectureState;

  final GenreState genreState;

  ///
  Future<void> getArtFacilities() async {
    final uploadData = <String, dynamic>{};

    uploadData['prefecture'] = prefectureState.selectPref;
    uploadData['genre'] = genreState.selectGenre;

    uploadData['latitude'] = latLngState.lat;
    uploadData['longitude'] = latLngState.lng;

    await client
        .post(path: APIPath.getNearArtFacilities, body: uploadData)
        .then((value) {
      final list = <Facility>[];

      final allIdList = <int>[];

      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        final val = Facility.fromJson(value['data'][i] as Map<String, dynamic>);

        list.add(val);
        allIdList.add(val.id);
      }

      state = state.copyWith(allList: list, allIdList: allIdList);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }

  ///
  Future<void> onCheckboxChange({required int id}) async {
    final selectIdList = [...state.selectIdList];

    if (selectIdList.contains(id)) {
      selectIdList.remove(id);
    } else {
      selectIdList.add(id);
    }

    state = state.copyWith(selectIdList: selectIdList);
  }

  ///
  Future<void> onAllCheckChange() async {
    final selectIdList = [...state.selectIdList];

    state = state.copyWith(
      selectIdList: (selectIdList.isEmpty) ? state.allIdList : [],
    );
  }
}

////////////////////////////////////////////////
