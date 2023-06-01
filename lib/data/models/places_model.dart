import 'dart:ffi';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Places {
  final String place_id;
  final String name;
  final LatLng location;
  final rating;
  final formatted_address;

  const Places({
    required this.name,
    required this.place_id,
    required this.location,
    required this.rating,
    required this.formatted_address
  });

  factory Places.fromJson(Map<String, dynamic> json) => Places(
    place_id: json['place_id'],
    name: json['name'],
    location: LatLng(json['geometry']["location"]["lat"], json['geometry']["location"]["lng"]),
    rating: json['rating'],
    formatted_address: (json['formatted_address'] != null) ? json['formatted_address'] : json['vicinity'],
  );

  Map<String, dynamic> toJson() => {
    'place_id': place_id,
    'name': name,
    'location': location,
    'rating': rating,
    'formatted_address': formatted_address,
  };
}