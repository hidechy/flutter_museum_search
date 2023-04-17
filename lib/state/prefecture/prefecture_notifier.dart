// ignore_for_file: avoid_catches_without_on_clauses, only_throw_errors, cascade_invocations

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

import '../../models/prefecture.dart';
import '../city/city_notifier.dart';
import 'prefecture_state.dart';

//////////////////////////////////////////////////////

final prefectureProvider =
    StateNotifierProvider.autoDispose<PrefectureNotifier, PrefectureState>(
        (ref) {
  return PrefectureNotifier(
    const PrefectureState(),
    ref: ref,
  )..getPrefecture();
});

class PrefectureNotifier extends StateNotifier<PrefectureState> {
  PrefectureNotifier(super.state, {required this.ref});

  final AutoDisposeStateNotifierProviderRef<PrefectureNotifier, PrefectureState>
      ref;

  ///
  Future<void> getPrefecture() async {
    try {
      const url = 'https://opendata.resas-portal.go.jp/api/v1/prefectures';

      final response = await get(Uri.parse(url), headers: {
        'X-API-KEY': 'Ts179qBc5oStoDfIwKobqnZBH4nobSSbDGVX7CJq',
        'Content-Type': 'application/json',
      });

      final prefecture = prefectureFromJson(response.body);

      final list = <Pref>[];

      list.add(Pref(prefCode: 0, prefName: ''));

      prefecture.result.forEach(list.add);

      state = state.copyWith(prefList: list);
    } catch (e) {
      throw e.toString();
    }
  }

  ///
  Future<void> selectPref({required int prefCode}) async {
    //-----------------------------------------//
    final prefList = [...state.prefList];

    var selectPref = Pref(prefCode: 0, prefName: '');
    prefList.forEach((element) {
      if (element.prefCode == prefCode) {
        selectPref = element;
      }
    });

    await ref.watch(cityProvider.notifier).getCity(pref: selectPref);
    //-----------------------------------------//

    state = state.copyWith(selectPrefCode: prefCode);
  }

  ///
  Future<void> clearPref() async {
    state = state.copyWith(selectPrefCode: 0);
  }
}

//////////////////////////////////////////////////////
