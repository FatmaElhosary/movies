import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/watched-tab/theme/theme_helper.dart';
import 'package:movies/watched-tab/views/widgets/watchListView.dart';


class watchedMovies extends StatelessWidget {
  const watchedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              child: WatchListView(),
            )
          ],
        ),
      ),
    );
  }
}


