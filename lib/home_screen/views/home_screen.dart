import 'package:flutter/material.dart';
import 'package:movies/constants.dart';
import 'package:movies/home_screen/view_model/movies_provider.dart';
import 'package:movies/home_screen/views/home_tap.dart';
import 'package:provider/provider.dart';

class HomeMovies extends StatelessWidget {
  static const String routeName = '/';
  const HomeMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.blackColor,
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<MoviesProvider>(
            create: (_) => MoviesProvider(),
          ),
        ],
        child: const SafeArea(
          child: HomeTab(
              //YOur code goes here
              ),
        ),
      ),

      //MultiProvider(child: HomeTab()),
    );
  }
}
