import 'dart:async';
import 'package:blocarc/models/movies.dart';
import 'package:blocarc/provider/movies-api.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<Movies> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}
