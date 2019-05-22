import 'package:blocarc/src/blocs/moviedetails-bloc-provider.dart';
import 'package:blocarc/src/ui/movie-details.dart';
import 'package:flutter/material.dart';
import '../models/movies-model.dart';
import '../blocs/movies-bloc.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoviesListState();
  }
}

class MoviesListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<Movies> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<Movies> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
                fit: BoxFit.cover,
              ),
              onTap: () => openDetailPage(snapshot.data, index),
            ),
          );
      },
    );
  }

  openDetailPage(Movies data, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MovieDetailBlocProvider(
          child: MovieDetail(
            title: data.results[index].title,
            posterUrl: data.results[index].backdropPath,
            description: data.results[index].overview,
            releaseDate: data.results[index].releaseDate,
            voteAverage: data.results[index].voteAverage.toString(),
            movieId: data.results[index].id,
          ),
        );
      }),
    );
  }

}
