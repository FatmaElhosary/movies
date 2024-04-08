import 'package:flutter/material.dart';
import 'package:movies/search_tab/view_model/search_provider.dart';

import 'package:movies/shared/constants.dart';
import 'package:movies/shared/waiting_widget.dart';
import 'package:movies/watched-tab/theme/theme_helper.dart';
import 'package:movies/watched-tab/views/widgets/watched_movie_item.dart';
import 'package:provider/provider.dart';

class SearchMovies extends StatefulWidget {
  const SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  final controller = TextEditingController();
  late SearchProvider viewModel;
  @override
  void initState() {
    viewModel = SearchProvider();
    super.initState();
  }

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
            onSubmitted: (query) {
              viewModel.getSearchMovies(query);
            },
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
        Expanded(
          child: ChangeNotifierProvider(
            create: (BuildContext context) => viewModel,
            child: Consumer<SearchProvider>(
              builder: (BuildContext context, searchProvider, Widget? child) {
                if (searchProvider.searchIsLoading) {
                  return const WatingWidget();
                } else if (searchProvider.searchErrorMessage != null) {
                  return Text(searchProvider.searchErrorMessage!);
                } else if (searchProvider.searchMovies.isEmpty) {
                  return const Column(
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
                  );
                }
                return ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  itemBuilder: (context, index) => WatchedMovieItem(
                    searchProvider.searchMovies[index],
                    isMarked: false,
                  ),
                  itemCount: searchProvider.searchMovies.length,
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.5),
                      child: SizedBox(
                        width: 358,
                        child: Divider(
                          height: 20,
                          thickness: 1,
                          color: appTheme.gray600,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    ));
  }
}
