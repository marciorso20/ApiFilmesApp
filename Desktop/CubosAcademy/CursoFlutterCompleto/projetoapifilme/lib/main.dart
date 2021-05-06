import 'package:flutter/material.dart';
import 'package:projetoapifilme/views/view_card.dart';
import 'package:projetoapifilme/views/view_movie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MovieView(),
    );
  }
}
