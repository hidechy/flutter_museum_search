class Station {
  Station({
    required this.stationName,
    required this.lat,
    required this.lng,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        stationName: json['stationName'].toString(),
        lat: json['lat'].toString(),
        lng: json['lng'].toString(),
      );

  String stationName;
  String lat;
  String lng;

  Map<String, dynamic> toJson() => {
        'stationName': stationName,
        'lat': lat,
        'lng': lng,
      };
}
