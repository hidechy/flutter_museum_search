// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../utility/utility.dart';
import 'genre_state.dart';

//////////////////////////////////////////////////////

final genreProvider =
    StateNotifierProvider.autoDispose<GenreNotifier, GenreState>((ref) {
  final client = ref.watch(httpClientProvider);

  final utility = Utility();

  return GenreNotifier(const GenreState(), client, utility)..getGenre();
});

class GenreNotifier extends StateNotifier<GenreState> {
  GenreNotifier(super.state, this.client, this.utility);

  final HttpClient client;
  final Utility utility;

  ///
  Future<void> getGenre() async {
    await client.post(path: APIPath.getArtGenre).then((value) {
      final list = <String>[];

      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        list.add(value['data'][i].toString());
      }

      state = state.copyWith(genreList: list);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }

  ///
  Future<void> selectGenre({required String genre}) async {
    state = state.copyWith(selectGenre: genre);
  }

  ///
  Future<void> clearGenre() async {
    state = state.copyWith(selectGenre: '');
  }
}

//////////////////////////////////////////////////////
