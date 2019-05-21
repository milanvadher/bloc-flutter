import 'package:blocarc/models/movies.dart';
import 'package:blocarc/repository/movies-repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<Movies>();

  Observable<Movies> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    Movies itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
