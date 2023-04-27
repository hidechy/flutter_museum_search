import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_route_response_state.freezed.dart';

@freezed
class SelectRouteResponseState with _$SelectRouteResponseState {
  const factory SelectRouteResponseState({
    ///
    @Default([]) List<String> selectedIds,
  }) = _SelectRouteResponseState;
}
