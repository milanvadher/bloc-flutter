import 'dart:async';

import './movies-api-provider.dart';
import '../models/movies-model.dart';
import '../models/movietrailer-model.dart';

class MoviesRepository {
  final moviesApiProvider = MoviesApiProvider();

  Future<Movies> fetchMovies() => moviesApiProvider.fetchMoviesList();
  
  Future<Trailers> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);
}
