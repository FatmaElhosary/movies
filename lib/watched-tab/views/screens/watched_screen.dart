import 'package:flutter/material.dart';
import 'package:movies/watched-tab/theme/theme_helper.dart';
import 'package:movies/watched-tab/views/widgets/watched_movie_item.dart';
import 'package:movies/watched-tab/watch_tab_provider.dart';
import 'package:provider/provider.dart';

class WatchedMovies extends StatelessWidget {
  const WatchedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final watchProvider = Provider.of<WatchListProvider>(context);
    watchProvider.getMovies();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Watchlist",
                style: theme.textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>
                      WatchedMovieItem(watchProvider.movies[index]),
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.5),
                      child: SizedBox(
                        width: 358,
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: appTheme.gray600,
                        ),
                      ),
                    );
                  },
                  itemCount: watchProvider.movies.length),
            )
          ],
        ),
      ),
    );
  }
}
