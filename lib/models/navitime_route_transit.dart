// ignore_for_file: inference_failure_on_untyped_parameter, avoid_dynamic_calls, inference_failure_on_collection_literal

/*
https://navitime-route-totalnavi.p.rapidapi.com/route_transit?start=35.665251%2C139.712092&goal=35.718571,139.5870214&start_time=2020-08-19T10%3A00%3A00&datum=wgs84&term=1440&limit=5&coord_unit=degree

https://navitime-route-totalnavi.p.rapidapi.com/route_transit
?start=35.665251%2C139.712092
&goal=35.718571,139.5870214
&start_time=2020-08-19T10%3A00%3A00
&datum=wgs84
&term=1440
&limit=5
&coord_unit=degree



X-RapidAPI-Host
navitime-route-totalnavi.p.rapidapi.com

X-RapidAPI-Key
e7737991e9mshe2f9b08fce63cddp186074jsn686b1f74dc33

*/

// To parse this JSON data, do
//
//     final routeTransit = routeTransitFromJson(jsonString);

import 'dart:convert';

import 'package:museum_search/extensions/extensions.dart';

RouteTransit routeTransitFromJson(String str) =>
    RouteTransit.fromJson(json.decode(str) as Map<String, dynamic>);

String routeTransitToJson(RouteTransit data) => json.encode(data.toJson());

///
class RouteTransit {
  RouteTransit({
    required this.items,
    required this.unit,
  });

  factory RouteTransit.fromJson(Map<String, dynamic> json) => RouteTransit(
        items: List<Item>.from(
            json['items'].map((x) => Item.fromJson(x as Map<String, dynamic>))
                as Iterable<dynamic>),
        unit: Unit.fromJson(json['unit'] as Map<String, dynamic>),
      );

  List<Item> items;
  Unit unit;

  Map<String, dynamic> toJson() => {
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
        'unit': unit.toJson(),
      };
}

///
class Item {
  Item({
    required this.summary,
    required this.sections,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        summary: Summary.fromJson(json['summary'] as Map<String, dynamic>),
        sections: List<Section>.from(json['sections']
                .map((x) => Section.fromJson(x as Map<String, dynamic>))
            as Iterable<dynamic>),
      );

  Summary summary;
  List<Section> sections;

  Map<String, dynamic> toJson() => {
        'summary': summary.toJson(),
        'sections': List<dynamic>.from(sections.map((x) => x.toJson())),
      };
}

///
class Section {
  Section({
    required this.type,
    this.coord,
    this.name,
    this.move,
    this.fromTime,
    this.toTime,
    this.time,
    this.distance,
    this.lineName,
    this.nodeId,
    this.nodeTypes,
    this.gateway,
    this.numbering,
    this.nextTransit,
    this.transport,
    this.transferSeconds,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        type: json['type'].toString(),
        coord: json['coord'] == null
            ? null
            : Coord.fromJson(json['coord'] as Map<String, dynamic>),
        name: json['name'].toString(),
        move: json['move'].toString(),
        fromTime: json['from_time'] == null
            ? null
            : DateTime.parse(json['from_time'].toString()),
        toTime: json['to_time'] == null
            ? null
            : DateTime.parse(json['to_time'].toString()),
        time: json['time'].toString().toInt(),
        distance: json['distance'].toString().toInt(),
        lineName: json['line_name'].toString(),
        nodeId: json['node_id'].toString(),
        nodeTypes: json['node_types'] == null
            ? []
            : List<String>.from(
                json['node_types']!.map((x) => x) as Iterable<dynamic>),
        gateway: json['gateway'].toString(),
        numbering: json['numbering'] == null
            ? null
            : Numbering.fromJson(json['numbering'] as Map<String, dynamic>),
        nextTransit: json['next_transit'] as bool,
        transport: json['transport'] == null
            ? null
            : Transport.fromJson(json['transport'] as Map<String, dynamic>),
        transferSeconds: json['transfer_seconds'].toString().toInt(),
      );

  String type;
  Coord? coord;
  String? name;
  String? move;
  DateTime? fromTime;
  DateTime? toTime;
  int? time;
  int? distance;
  String? lineName;
  String? nodeId;
  List<String>? nodeTypes;
  String? gateway;
  Numbering? numbering;
  bool? nextTransit;
  Transport? transport;
  int? transferSeconds;

  Map<String, dynamic> toJson() => {
        'type': type,
        'coord': coord?.toJson(),
        'name': name,
        'move': move,
        'from_time': fromTime?.toIso8601String(),
        'to_time': toTime?.toIso8601String(),
        'time': time,
        'distance': distance,
        'line_name': lineName,
        'node_id': nodeId,
        'node_types': nodeTypes == null
            ? []
            : List<dynamic>.from(nodeTypes!.map((x) => x)),
        'gateway': gateway,
        'numbering': numbering?.toJson(),
        'next_transit': nextTransit,
        'transport': transport?.toJson(),
        'transfer_seconds': transferSeconds,
      };
}

///
class Coord {
  Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json['lat'].toString().toDouble(),
        lon: json['lon'].toString().toDouble(),
      );

  double lat;
  double lon;

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lon': lon,
      };
}

///
class Numbering {
  Numbering({
    this.departure,
    this.arrival,
  });

  factory Numbering.fromJson(Map<String, dynamic> json) => Numbering(
        departure: json['departure'] == null
            ? []
            : List<Arrival>.from(json['departure']!
                    .map((x) => Arrival.fromJson(x as Map<String, dynamic>))
                as Iterable<dynamic>),
        arrival: json['arrival'] == null
            ? []
            : List<Arrival>.from(json['arrival']!
                    .map((x) => Arrival.fromJson(x as Map<String, dynamic>))
                as Iterable<dynamic>),
      );

  List<Arrival>? departure;
  List<Arrival>? arrival;

  Map<String, dynamic> toJson() => {
        'departure': departure == null
            ? []
            : List<dynamic>.from(departure!.map((x) => x.toJson())),
        'arrival': arrival == null
            ? []
            : List<dynamic>.from(arrival!.map((x) => x.toJson())),
      };
}

///
class Arrival {
  Arrival({
    required this.symbol,
    required this.number,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        symbol: json['symbol'].toString(),
        number: json['number'].toString(),
      );

  String symbol;
  String number;

  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'number': number,
      };
}

///
class Transport {
  Transport({
    required this.fare,
    required this.getoff,
    required this.color,
    required this.name,
    required this.fareSeason,
    required this.company,
    required this.links,
    required this.id,
    required this.type,
    required this.fareBreak,
    this.fareDetail,
  });

  factory Transport.fromJson(Map<String, dynamic> json) => Transport(
        fare: Map.from(json['fare'] as Map<dynamic, dynamic>).map((k, v) =>
            MapEntry<String, int>(k.toString(), v.toString().toInt())),
        getoff: json['getoff'].toString(),
        color: json['color'].toString(),
        name: json['name'].toString(),
        fareSeason: json['fare_season'].toString(),
        company: Company.fromJson(json['company'] as Map<String, dynamic>),
        links: List<Link>.from(
            json['links'].map((x) => Link.fromJson(x as Map<String, dynamic>))
                as Iterable<dynamic>),
        id: json['id'].toString(),
        type: json['type'].toString(),
        fareBreak: Map.from(json['fare_break'] as Map<dynamic, dynamic>)
            .map((k, v) => MapEntry<String, bool>(k.toString(), v as bool)),
        fareDetail: json['fare_detail'] == null
            ? []
            : List<FareDetail>.from(json['fare_detail']!
                    .map((x) => FareDetail.fromJson(x as Map<String, dynamic>))
                as Iterable<dynamic>),
      );

  Map<String, int> fare;
  String getoff;
  String color;
  String name;
  String fareSeason;
  Company company;
  List<Link> links;
  String id;
  String type;
  Map<String, bool> fareBreak;
  List<FareDetail>? fareDetail;

  Map<String, dynamic> toJson() => {
        'fare': Map.from(fare)
            .map((k, v) => MapEntry<String, dynamic>(k.toString(), v)),
        'getoff': getoff,
        'color': color,
        'name': name,
        'fare_season': fareSeason,
        'company': company.toJson(),
        'links': List<dynamic>.from(links.map((x) => x.toJson())),
        'id': id,
        'type': type,
        'fare_break': Map.from(fareBreak)
            .map((k, v) => MapEntry<String, dynamic>(k.toString(), v)),
        'fare_detail': fareDetail == null
            ? []
            : List<dynamic>.from(fareDetail!.map((x) => x.toJson())),
      };
}

///
class Company {
  Company({
    required this.id,
    required this.name,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json['id'].toString(),
        name: json['name'].toString(),
      );

  String id;
  String name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

///
class FareDetail {
  FareDetail({
    required this.start,
    required this.goal,
    required this.fare,
    required this.id,
  });

  factory FareDetail.fromJson(Map<String, dynamic> json) => FareDetail(
        start: FareDetailGoal.fromJson(json['start'] as Map<String, dynamic>),
        goal: FareDetailGoal.fromJson(json['goal'] as Map<String, dynamic>),
        fare: json['fare'].toString().toInt(),
        id: json['id'].toString(),
      );

  FareDetailGoal start;
  FareDetailGoal goal;
  int fare;
  String id;

  Map<String, dynamic> toJson() => {
        'start': start.toJson(),
        'goal': goal.toJson(),
        'fare': fare,
        'id': id,
      };
}

///
class FareDetailGoal {
  FareDetailGoal({
    required this.nodeId,
    required this.name,
  });

  factory FareDetailGoal.fromJson(Map<String, dynamic> json) => FareDetailGoal(
        nodeId: json['node_id'].toString(),
        name: json['name'].toString(),
      );

  String nodeId;
  String name;

  Map<String, dynamic> toJson() => {
        'node_id': nodeId,
        'name': name,
      };
}

///
class Link {
  Link({
    required this.id,
    required this.name,
    required this.direction,
    required this.destination,
    required this.from,
    required this.to,
    required this.isTimetable,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        id: json['id'].toString(),
        name: json['name'].toString(),
        direction: json['direction'].toString(),
        destination:
            Company.fromJson(json['destination'] as Map<String, dynamic>),
        from: Company.fromJson(json['from'] as Map<String, dynamic>),
        to: Company.fromJson(json['to'] as Map<String, dynamic>),
        isTimetable: json['is_timetable'].toString(),
      );

  String id;
  String name;
  String direction;
  Company destination;
  Company from;
  Company to;
  String isTimetable;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'direction': direction,
        'destination': destination.toJson(),
        'from': from.toJson(),
        'to': to.toJson(),
        'is_timetable': isTimetable,
      };
}

///
class Summary {
  Summary({
    required this.no,
    required this.start,
    required this.goal,
    required this.move,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        no: json['no'].toString(),
        start: SummaryGoal.fromJson(json['start'] as Map<String, dynamic>),
        goal: SummaryGoal.fromJson(json['goal'] as Map<String, dynamic>),
        move: MoveClass.fromJson(json['move'] as Map<String, dynamic>),
      );

  String no;
  SummaryGoal start;
  SummaryGoal goal;
  MoveClass move;

  Map<String, dynamic> toJson() => {
        'no': no,
        'start': start.toJson(),
        'goal': goal.toJson(),
        'move': move.toJson(),
      };
}

///
class SummaryGoal {
  SummaryGoal({
    required this.type,
    required this.coord,
    required this.name,
  });

  factory SummaryGoal.fromJson(Map<String, dynamic> json) => SummaryGoal(
        type: json['type'].toString(),
        coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
        name: json['name'].toString(),
      );

  String type;
  Coord coord;
  String name;

  Map<String, dynamic> toJson() => {
        'type': type,
        'coord': coord.toJson(),
        'name': name,
      };
}

///
class MoveClass {
  MoveClass({
    required this.transitCount,
    required this.walkDistance,
    required this.fare,
    required this.type,
    required this.fromTime,
    required this.toTime,
    required this.time,
    required this.distance,
    required this.moveType,
  });

  factory MoveClass.fromJson(Map<String, dynamic> json) => MoveClass(
        transitCount: json['transit_count'].toString().toInt(),
        walkDistance: json['walk_distance'].toString().toInt(),
        fare: Fare.fromJson(json['fare'] as Map<String, dynamic>),
        type: json['type'].toString(),
        fromTime: DateTime.parse(json['from_time'].toString()),
        toTime: DateTime.parse(json['to_time'].toString()),
        time: json['time'].toString().toInt(),
        distance: json['distance'].toString().toInt(),
        moveType: List<String>.from(
            json['move_type'].map((x) => x) as Iterable<dynamic>),
      );

  int transitCount;
  int walkDistance;
  Fare fare;
  String type;
  DateTime fromTime;
  DateTime toTime;
  int time;
  int distance;
  List<String> moveType;

  Map<String, dynamic> toJson() => {
        'transit_count': transitCount,
        'walk_distance': walkDistance,
        'fare': fare.toJson(),
        'type': type,
        'from_time': fromTime.toIso8601String(),
        'to_time': toTime.toIso8601String(),
        'time': time,
        'distance': distance,
        'move_type': List<dynamic>.from(moveType.map((x) => x)),
      };
}

///
class Fare {
  Fare({
    required this.unit0,
    required this.unit48,
    required this.unit128Train,
    required this.unit130Train,
    required this.unit133Train,
  });

  factory Fare.fromJson(Map<String, dynamic> json) => Fare(
        unit0: json['unit_0'].toString().toInt(),
        unit48: json['unit_48'].toString().toInt(),
        unit128Train: json['unit_128_train'].toString().toInt(),
        unit130Train: json['unit_130_train'].toString().toInt(),
        unit133Train: json['unit_133_train'].toString().toInt(),
      );

  int unit0;
  int unit48;
  int unit128Train;
  int unit130Train;
  int unit133Train;

  Map<String, dynamic> toJson() => {
        'unit_0': unit0,
        'unit_48': unit48,
        'unit_128_train': unit128Train,
        'unit_130_train': unit130Train,
        'unit_133_train': unit133Train,
      };
}

///
class Unit {
  Unit({
    required this.datum,
    required this.coordUnit,
    required this.distance,
    required this.time,
    required this.currency,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        datum: json['datum'].toString(),
        coordUnit: json['coord_unit'].toString(),
        distance: json['distance'].toString(),
        time: json['time'].toString(),
        currency: json['currency'].toString(),
      );

  String datum;
  String coordUnit;
  String distance;
  String time;
  String currency;

  Map<String, dynamic> toJson() => {
        'datum': datum,
        'coord_unit': coordUnit,
        'distance': distance,
        'time': time,
        'currency': currency,
      };
}
