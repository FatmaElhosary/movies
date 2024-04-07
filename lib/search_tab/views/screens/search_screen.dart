import 'package:flutter/material.dart';

import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/constants.dart';

class SearchMovies extends StatefulWidget {
  const SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: SearchBar(
            hintText: 'Search',
            controller: controller,
            // backgroundColor: MaterialStateProperty<Color?>?(Color:Constants.darkgreyColor),
            padding: MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            leading: Icon(
              Icons.search,
              color: Constants.whiteColor,
            ),
          ),
        ),
        Center(
          child: Expanded(
            child: Column(
              children: [
                Container(
                  height: 87.86,
                  width: 78.09,
                  child: Icon(
                    Icons.local_movies,
                    color: Constants.lightgreyColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text('No movies found'),
      ],
    ));
  }
}
