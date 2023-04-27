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
}

//////////////////////////////////////////////////////
