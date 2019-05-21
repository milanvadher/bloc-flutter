import 'package:blocarc/ui/movies-list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BloC Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MovieList(),
    );
  }
}
