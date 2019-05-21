import 'package:blocarc/blocs/movies-bloc.dart';
import 'package:blocarc/models/movies.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<Movies> snapshot) {
          if (snapshot.hasData) {
            return buildPostView(snapshot.data.results);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

Widget buildPostView(List<Movie> movies) {
  return ListView(
    children: List.generate(movies.length, (int index) {
      Movie movie = movies[index];
      return Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                child: Text('${movie.voteAverage}'),
              ),
              title: Text(movie.title),
              subtitle: Text('${movie.releaseDate}'),
            ),
            Container(
              child: Image.network('https://image.tmdb.org/t/p/w185${movie.posterPath}'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text('${movie.overview}'),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(5),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.thumb_up),
                        SizedBox(width: 10),
                        Text('${movie.voteCount}')
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.poll),
                        SizedBox(width: 10),
                        Text('${movie.popularity}')
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }),
  );
}