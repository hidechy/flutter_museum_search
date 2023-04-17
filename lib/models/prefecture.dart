// To parse this JSON data, do
//
//     final prefecture = prefectureFromJson(jsonString);

// ignore_for_file: inference_failure_on_untyped_parameter, avoid_dynamic_calls

import 'dart:convert';

import 'package:museum_search/extensions/extensions.dart';

Prefecture prefectureFromJson(String str) =>
    Prefecture.fromJson(json.decode(str) as Map<String, dynamic>);

String prefectureToJson(Prefecture data) => json.encode(data.toJson());

class Prefecture {
  Prefecture({
    this.message,
    required this.result,
  });

  factory Prefecture.fromJson(Map<String, dynamic> json) => Prefecture(
        message: json['message'],
        result: List<PrefectureData>.from(json['result']
                .map((x) => PrefectureData.fromJson(x as Map<String, dynamic>))
            as Iterable<dynamic>),
      );

  dynamic message;
  List<PrefectureData> result;

  Map<String, dynamic> toJson() => {
        'message': message,
        'result': List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class PrefectureData {
  PrefectureData({
    required this.prefCode,
    required this.prefName,
  });

  factory PrefectureData.fromJson(Map<String, dynamic> json) => PrefectureData(
        prefCode: json['prefCode'].toString().toInt(),
        prefName: json['prefName'].toString(),
      );

  int prefCode;
  String prefName;

  Map<String, dynamic> toJson() => {
        'prefCode': prefCode,
        'prefName': prefName,
      };
}
