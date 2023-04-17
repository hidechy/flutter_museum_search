// ignore_for_file: avoid_catches_without_on_clauses, only_throw_errors

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

import '../../models/route_transit.dart';
import 'route_transit_request_state.dart';
import 'route_transit_response_state.dart';

//////////////////////////////////////////////////////

final routeTransitProvider =
    StateNotifierProvider.autoDispose<RouteTransitNotifier, RouteTransitState>(
        (ref) {
  return RouteTransitNotifier(const RouteTransitState());
});

class RouteTransitNotifier extends StateNotifier<RouteTransitState> {
  RouteTransitNotifier(super.state);

  Future<void> getRouteTransit(
      {required RouteTransitRequestState param}) async {
    //  try {
    final queryParameters = <String>[
      'start=${param.start}',
      'goal=${param.goal}',
      'start_time=${param.startTime}',
      'format=json',
      'term=1440',
      'limit=5',
      'datum=wgs84',
      'coord_unit=degree',
      'shape_color=railway_line',
      'options=transport_shape',
    ];

    final url =
        "https://navitime-route-totalnavi.p.rapidapi.com/shape_transit?${queryParameters.join('&')}";

    final header = <String, String>{
      'X-RapidAPI-Host': 'navitime-route-totalnavi.p.rapidapi.com',
      'X-RapidAPI-Key': 'e7737991e9mshe2f9b08fce63cddp186074jsn686b1f74dc33'
    };

    final response = await get(Uri.parse(url), headers: header);

    final routeTransit = routeTransitFromJson(response.body);

    final list = <RouteTransitResponseItemState>[];

    routeTransit.items[0].path.forEach((element) {
      element.coords.forEach((element2) {
        list.add(
          RouteTransitResponseItemState(
            latitude: element2[0].toString(),
            longitude: element2[1].toString(),
          ),
        );
      });
    });

    state = state.copyWith(list: list);
    // } catch (e) {
    //   throw e.toString();
    // }
  }
}

//////////////////////////////////////////////////////
