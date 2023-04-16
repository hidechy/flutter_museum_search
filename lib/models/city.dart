/*
http://toyohide.work/BrainLog/api/getArtCity

{"prefCode":1, "prefecture":"北海道"}

{
    "data": [
        {
            "prefCode": 1,
            "cityCode": "01100",
            "cityName": "札幌市",
            "bigCityFlag": "2",
            "count": 15
        },

*/

// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

// ignore_for_file: inference_failure_on_untyped_parameter, avoid_dynamic_calls

import 'dart:convert';

import '../extensions/extensions.dart';

City cityFromJson(String str) =>
    City.fromJson(json.decode(str) as Map<String, dynamic>);

String cityToJson(City data) => json.encode(data.toJson());

class City {
  City({
    required this.data,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        data: List<CityData>.from(json['data']
                .map((x) => CityData.fromJson(x as Map<String, dynamic>))
            as Iterable<dynamic>),
      );

  List<CityData> data;

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CityData {
  CityData({
    required this.prefCode,
    required this.cityCode,
    required this.cityName,
    required this.bigCityFlag,
    required this.count,
  });

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
        prefCode: json['prefCode'].toString().toInt(),
        cityCode: json['cityCode'].toString(),
        cityName: json['cityName'].toString(),
        bigCityFlag: json['bigCityFlag'].toString(),
        count: json['count'].toString().toInt(),
      );

  int prefCode;
  String cityCode;
  String cityName;
  String bigCityFlag;
  int count;

  Map<String, dynamic> toJson() => {
        'prefCode': prefCode,
        'cityCode': cityCode,
        'cityName': cityName,
        'bigCityFlag': bigCityFlag,
        'count': count,
      };
}
