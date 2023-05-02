import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/company_train.dart';

part 'company_train_response_state.freezed.dart';

@freezed
class CompanyTrainResponseState with _$CompanyTrainResponseState {
  const factory CompanyTrainResponseState({
    //
    @Default([]) List<Company> companyTrainList,
  }) = _CompanyTrainResponseState;
}
