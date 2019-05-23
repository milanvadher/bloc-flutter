import 'dart:async';
import 'dart:convert';
import 'package:blocarc/src/models/movietrailer-model.dart';

import '../models/movies-model.dart';
import 'package:http/http.dart' show Client;

class MoviesApiProvider {
  Client client = Client();
  final String apiKey = '802b2c4b88ea1183e50e6b285a27696e';
  final String apiUrl = 'http://api.themoviedb.org/3/movie';

  Future<Movies> fetchMoviesList() async {
    final response =
        await client.get('$apiUrl/popular?api_key=$apiKey');
    if (response.statusCode == 200) {
      return Movies.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Movies');
    }
  }

  Future<Trailers> fetchTrailer(int movieId) async {
    final response = await client.get('$apiUrl/$movieId/videos?api_key=$apiKey');
    print(response.body.toString());
    if (response.statusCode == 200) {
      return Trailers.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}
