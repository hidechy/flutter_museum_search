import 'package:freezed_annotation/freezed_annotation.dart';

part 'polyline_request_state.freezed.dart';

@freezed
class PolylineRequestState with _$PolylineRequestState {
  const factory PolylineRequestState({
    @Default('') String origin,
    @Default('') String destination,
  }) = _PolylineRequestState;
}
