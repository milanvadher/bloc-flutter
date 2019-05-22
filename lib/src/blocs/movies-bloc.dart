import '../resources/movies-repository.dart';
import '../models/movies-model.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final repository = MoviesRepository();
  final moviesFetcher = PublishSubject<Movies>();

  Observable<Movies> get allMovies => moviesFetcher.stream;

  fetchAllMovies() async {
    Movies movies = await repository.fetchMovies();
    moviesFetcher.sink.add(movies);
  }

  dispose() {
    moviesFetcher.close();
  }
}

final bloc = MoviesBloc();