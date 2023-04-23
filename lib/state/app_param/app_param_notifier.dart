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
  Future<void> setSearchErrorFlag({required String searchErrorMessage}) async {
    state = state.copyWith(
      searchErrorFlag: true,
      searchErrorMessage: searchErrorMessage,
    );
  }

  ///
  Future<void> clearSearchErrorFlag() async =>
      state = state.copyWith(searchErrorFlag: false, searchErrorMessage: '');

  ///
  Future<void> setSelectedRouteNumber(
          {required String selectedRouteNumber}) async =>
      state = state.copyWith(selectedRouteNumber: selectedRouteNumber);

  ///
  Future<void> clearSelectedRouteNumber() async =>
      state = state.copyWith(selectedRouteNumber: '');

  ///
  Future<void> setBaseInclude({required int baseInclude}) async {
    state = state.copyWith(baseInclude: baseInclude);
  }
}

//////////////////////////////////////////////////////
