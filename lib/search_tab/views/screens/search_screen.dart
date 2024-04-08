import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          padding: const EdgeInsets.all(16.0),
          child: SearchBar(
            textStyle: MaterialStatePropertyAll(
                Theme.of(context).textTheme.headlineMedium),
            side: const MaterialStatePropertyAll(
                BorderSide(width: 1, color: Constants.whiteColor)),
            onSubmitted: (searchKey) {},
            hintText: 'Search',
            controller: controller,
            backgroundColor:
                const MaterialStatePropertyAll(Constants.darkgreyColor),
            padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            leading: const Icon(
              Icons.search,
              color: Constants.whiteColor,
            ),
          ),
        ),
        const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.local_movies,
                color: Constants.lightgreyColor,
                size: 100,
              ),
              Text(
                'No movies found',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
