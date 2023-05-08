// To parse this JSON data, do
//
//     final genre = genreFromJson(jsonString);

// ignore_for_file: inference_failure_on_untyped_parameter, avoid_dynamic_calls

/*
http://toyohide.work/BrainLog/api/getArtGenre

{
    "data": [
        "",
        "アート系",
        "人文・歴史系",
        "自然・科学系",
        "ギャラリー",
        "ミュージアム",
        "その他"
    ]
}

*/

import 'dart:convert';

Genre genreFromJson(String str) =>
    Genre.fromJson(json.decode(str) as Map<String, dynamic>);

String genreToJson(Genre data) => json.encode(data.toJson());

class Genre {
  Genre({
    required this.data,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        data:
            List<String>.from(json['data'].map((x) => x) as Iterable<dynamic>),
      );

  List<String> data;

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x)),
      };
}
