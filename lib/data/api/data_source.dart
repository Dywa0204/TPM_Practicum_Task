
import 'dart:convert';

import 'package:final_project/data/models/place_detail_model.dart';
import 'package:final_project/data/models/direction_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:final_project/data/models/places_model.dart';

import '../../utils/.env.dart';

class ApiDataSource {
  final String _baseUrl = "https://maps.googleapis.com/maps/api/place/";
  final String _baseUrlDirection = "https://maps.googleapis.com/maps/api/directions/";

  static ApiDataSource instance = ApiDataSource();

  Future<List<Places>> loadNearbyPlaces(
        LatLng _location, String _radius
      ) async {
    final response = await http.get(
        Uri.parse("${_baseUrl}nearbysearch/json?type=hospital&radius=$_radius&location=${_location.latitude.toString()},${_location.longitude.toString()}&key=$googleAPIKey")
    );

    if (response.statusCode == 200) {
      final List<dynamic> placesJson = json.decode(response.body)["results"];
      final List<Places> places = placesJson.map((place) => Places.fromJson(place)).toList();
      return places;
    }

    final String errorMessage = "Failed";
    print(errorMessage);
    throw Exception(errorMessage);
  }

  Future<List<Places>> loadPlacesText(
      String _query
      ) async {
    final response = await http.get(
        Uri.parse("${_baseUrl}textsearch/json?type=hospital&query=${_query.replaceAll(" ", "%20")}&key=$googleAPIKey")
    );

    if (response.statusCode == 200) {
      final List<dynamic> placesJson = json.decode(response.body)["results"];
      final List<Places> places = placesJson.map((place) => Places.fromJson(place)).toList();
      return places;
    }

    final String errorMessage = "Failed";
    print(errorMessage);
    throw Exception(errorMessage);
  }

  Future<PlaceDetail> loadDetailPlace(
      String _place_id
      ) async {
    final response = await http.get(
        Uri.parse("${_baseUrl}details/json?place_id=${_place_id}&key=$googleAPIKey")
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> placesJson = json.decode(response.body)["result"];
      final PlaceDetail places = PlaceDetail.fromJson(placesJson);
      return places;
    }

    final String errorMessage = "Failed";
    print(errorMessage);
    throw Exception(errorMessage);
  }

  Future<Direction> loadDirection(
      LatLng _destination,
      LatLng _origin
      ) async {
    final response = await http.get(
        Uri.parse("${_baseUrlDirection}json?destination=${_destination.latitude.toString()},${_destination.longitude.toString()}&origin=${_origin.latitude.toString()},${_origin.longitude.toString()}&key=$googleAPIKey")
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> placesJson = json.decode(response.body)["routes"][0];
      final Direction places = Direction.fromJson(placesJson);
      return places;
    }

    final String errorMessage = "Failed";
    print(errorMessage);
    throw Exception(errorMessage);
  }
}