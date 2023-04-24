/*
http://toyohide.work/BrainLog/api/getNearStation

{"searchStation":["35.7|139.9", "35.7|139.9", "35.7|139.9","35.7|139.9","35.7|139.9","35.7|139.9"]}

{
    "data": [
        {
            "stationName": "新八柱",
            "lat": "35.792013",
            "lng": "139.938393"
        },

*/

import '../extensions/extensions.dart';

class Station {
  Station({
    required this.id,
    required this.stationName,
    required this.lat,
    required this.lng,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        id: json['id'].toString().toInt(),
        stationName: json['stationName'].toString(),
        lat: json['lat'].toString(),
        lng: json['lng'].toString(),
      );

  int id;
  String stationName;
  String lat;
  String lng;

  Map<String, dynamic> toJson() => {
        'id': id,
        'stationName': stationName,
        'lat': lat,
        'lng': lng,
      };
}
