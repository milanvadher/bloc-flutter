import 'package:rxdart/rxdart.dart';

import '../resources/movies-repository.dart';
import '../models/movietrailer-model.dart';

class MovieDetailsBloc {
  final movieRepository = MoviesRepository();
  final movieId = PublishSubject<int>();
  final trailers = BehaviorSubject<Future<Trailers>>();

  Function(int) get fetchTrailersById => movieId.sink.add;
  Observable<Future<Trailers>> get movieTrailers => trailers.stream;

  MovieDetailsBloc() {
    movieId.stream.transform(itemTransformer()).pipe(trailers);
  }

  dispose() async {
    movieId.close();
    await trailers.drain();
    trailers.close();
  }

  itemTransformer() {
    return ScanStreamTransformer(
      (Future<Trailers> trailer, int id, int index) {
        print(index);
        trailer = movieRepository.fetchTrailers(id);
        return trailer;
      },
    );
  }
}
