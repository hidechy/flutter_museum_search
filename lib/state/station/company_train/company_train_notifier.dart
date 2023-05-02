// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/http/client.dart';
import '../../../data/http/path.dart';
import '../../../extensions/extensions.dart';
import '../../../models/company_train.dart';
import '../../../utility/utility.dart';
import 'company_train_response_state.dart';

////////////////////////////////////////////////
final companyTrainProvider = StateNotifierProvider.autoDispose<
    CompanyTrainNotifier, CompanyTrainResponseState>((ref) {
  final client = ref.watch(httpClientProvider);

  final utility = Utility();

  return CompanyTrainNotifier(
    const CompanyTrainResponseState(),
    client,
    utility,
  )..getCompanyTrain();
});

class CompanyTrainNotifier extends StateNotifier<CompanyTrainResponseState> {
  CompanyTrainNotifier(
    super.state,
    this.client,
    this.utility,
  );

  final HttpClient client;
  final Utility utility;

  ///
  Future<void> getCompanyTrain() async {
    await client.post(path: APIPath.getTrainCompany).then((value) {
      final list = <Company>[];

      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        list.add(Company.fromJson(value['data'][i] as Map<String, dynamic>));
      }

      state = state.copyWith(companyTrainList: list);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}

////////////////////////////////////////////////
