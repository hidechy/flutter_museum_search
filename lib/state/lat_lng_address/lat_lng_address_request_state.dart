import 'package:freezed_annotation/freezed_annotation.dart';

part 'lat_lng_address_request_state.freezed.dart';

@freezed
class LatLngAddressRequestState with _$LatLngAddressRequestState {
  const factory LatLngAddressRequestState({
    @Default('') String latitude,
    @Default('') String longitude,
  }) = _LatLngAddressRequestState;
}
