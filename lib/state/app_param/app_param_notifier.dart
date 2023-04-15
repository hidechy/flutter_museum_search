import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_param_state.dart';

//////////////////////////////////////////////////////

final appParamProvider =
    StateNotifierProvider.autoDispose<AppParamNotifier, AppParamState>((ref) {
  return AppParamNotifier(const AppParamState());
});

class AppParamNotifier extends StateNotifier<AppParamState> {
  AppParamNotifier(super.state);

  ///
  Future<void> setSearchDisp({required bool searchDisp}) async =>
      state = state.copyWith(searchDisp: searchDisp);

  ///
  Future<void> setGenreSearchStop({required bool genreSearchStop}) async =>
      state = state.copyWith(genreSearchStop: genreSearchStop);

  ///
  Future<void> setSearchFlag({required bool searchFlag}) async =>
      state = state.copyWith(searchFlag: searchFlag);
}

//////////////////////////////////////////////////////
