/*
http://toyohide.work/BrainLog/api/getTrainStation
{"train_number":"11101"}

{
    "data": [
        {
            "station_name": "函館",
            "address": "北海道函館市若松町１２-１３",
            "lat": "41.773709",
            "lng": "140.726413",
            "line_number": 0
        },

*/

import '../extensions/extensions.dart';

class Station {
  Station({
    required this.id,
    required this.stationName,
    required this.address,
    required this.lat,
    required this.lng,
    required this.lineNumber,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        id: json['id'].toString().toInt(),
        stationName: json['station_name'].toString(),
        address: json['address'].toString(),
        lat: json['lat'].toString(),
        lng: json['lng'].toString(),
        lineNumber: json['line_number'].toString().toInt(),
      );

  int id;
  String stationName;
  String address;
  String lat;
  String lng;
  int lineNumber;

  Map<String, dynamic> toJson() => {
        'id': id,
        'station_name': stationName,
        'address': address,
        'lat': lat,
        'lng': lng,
        'line_number': lineNumber,
      };
}
