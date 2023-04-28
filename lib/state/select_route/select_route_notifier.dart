import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import 'select_route_response_state.dart';

//////////////////////////////////////////////////////

final selectRouteProvider = StateNotifierProvider.autoDispose<
    SelectRouteNotifier, SelectRouteResponseState>((ref) {
  final client = ref.read(httpClientProvider);

  return SelectRouteNotifier(const SelectRouteResponseState(), client);
});

class SelectRouteNotifier extends StateNotifier<SelectRouteResponseState> {
  SelectRouteNotifier(super.state, this.client);

  final HttpClient client;

  ///
  Future<void> setSelectedId({required String id}) async {
    final selectedIds = [...state.selectedIds];

    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }

    state = state.copyWith(selectedIds: selectedIds);
  }

  ///
  Future<void> clearSelectedId() async {
    state = state.copyWith(selectedIds: []);
  }

  ///
  Future<void> setSelectDate({required String date}) async =>
      state = state.copyWith(startNow: false, startTime: date);

  ///
  Future<void> setWalkSpeed({required int speed}) async =>
      state = state.copyWith(walkSpeed: speed);

  ///
  Future<void> setStartGoalBothSelect() async =>
      state = state.copyWith(startGoalBothSelect: true);

  ///
  Future<void> clearStartGoalBothSelect() async =>
      state = state.copyWith(startGoalBothSelect: false);

  ///
  Future<void> setSpotStayTime({required int time}) async =>
      state = state.copyWith(spotStayTime: time);

  ///
  Future<void> setAdjustPercent({required int adjust}) async =>
      state = state.copyWith(adjustPercent: adjust);
}

//////////////////////////////////////////////////////
