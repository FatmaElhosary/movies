import 'package:flutter/material.dart';
import 'package:movies/home_screen/views/home_screen.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      routes: {
        HomeMovies.routeName: (_) => const HomeMovies(),
      },
    );
  }
}
