
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:praktpm_responsi/data/models/movie_model.dart';

import '../models/movie_detail_model.dart';

class ApiDataSource {
  final String _baseUrl = "http://www.omdbapi.com/";

  static ApiDataSource instance = ApiDataSource();

  Future<List<MovieModel>> searchMovie (String keyword) async {
    final response = await http.get(
        Uri.parse("${_baseUrl}?apikey=46539e83&s=$keyword")
    );

    if (response.statusCode == 200) {
      final List<dynamic> placesJson = json.decode(response.body)["Search"];
      final List<MovieModel> places = placesJson.map((place) => MovieModel.fromJson(place)).toList();
      return places;
    }

    final String errorMessage = "Failed";
    print(errorMessage);
    throw Exception(errorMessage);
  }

  Future<MovieDetailModel> getDetailMovie (String id) async {
    final response = await http.get(
        Uri.parse("${_baseUrl}?apikey=46539e83&i=$id")
    );

    if (response.statusCode == 200) {
      final dynamic placesJson = json.decode(response.body);
      final MovieDetailModel places = MovieDetailModel.fromJson(placesJson);
      return places;
    }

    final String errorMessage = "Failed";
    print(errorMessage);
    throw Exception(errorMessage);
  }
}