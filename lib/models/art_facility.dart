/*
http://toyohide.work/BrainLog/api/getNearArtFacilities

{"latitude":"35.7102009", "longitude":"139.9490672"}

{
    "data": [
        {
            "id": 751,
            "name": "千葉県立現代産業科学館",
            "genre": "ミュージアム_自然・科学系",
            "address": "千葉県市川市鬼高1-1-3",
            "latitude": "35.7147118",
            "longitude": "139.932941",
            "dist": "1.9 km"
        },

*/

// To parse this JSON data, do
//
//     final artFacility = artFacilityFromJson(jsonString);

// ignore_for_file: inference_failure_on_untyped_parameter, avoid_dynamic_calls

import 'dart:convert';

import 'package:museum_search/extensions/extensions.dart';

ArtFacility artFacilityFromJson(String str) =>
    ArtFacility.fromJson(json.decode(str) as Map<String, dynamic>);

String artFacilityToJson(ArtFacility data) => json.encode(data.toJson());

class ArtFacility {
  ArtFacility({
    required this.data,
  });

  factory ArtFacility.fromJson(Map<String, dynamic> json) => ArtFacility(
        data: List<Facility>.from(json['data']
                .map((x) => Facility.fromJson(x as Map<String, dynamic>))
            as Iterable<dynamic>),
      );

  List<Facility> data;

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Facility {
  Facility({
    required this.id,
    required this.name,
    required this.genre,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.dist,
  });

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json['id'].toString().toInt(),
        name: json['name'].toString(),
        genre: json['genre'].toString(),
        address: json['address'].toString(),
        latitude: json['latitude'].toString(),
        longitude: json['longitude'].toString(),
        dist: json['dist'].toString(),
      );

  int id;
  String name;
  String genre;
  String address;
  String latitude;
  String longitude;
  String dist;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'genre': genre,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'dist': dist,
      };
}
