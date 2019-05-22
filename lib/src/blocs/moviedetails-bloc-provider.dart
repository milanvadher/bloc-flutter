import 'package:flutter/material.dart';
import './moviedetails-bloc.dart';

class MovieDetailBlocProvider extends InheritedWidget {
  final MovieDetailsBloc bloc;

  MovieDetailBlocProvider({Key key, Widget child})
      : bloc = MovieDetailsBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static MovieDetailsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MovieDetailBlocProvider)
            as MovieDetailBlocProvider)
        .bloc;
  }
}
