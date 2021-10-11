class Coordinates {
  double longitude = 0.0;
  double latitude = 0.0;

  Coordinates({required this.longitude, required this.latitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}