import 'package:flutter/material.dart';
import 'package:movies/watched-tab/theme/theme_helper.dart';
import 'package:movies/watched-tab/views/widgets/watchedMovieItem.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context,index) => watchedMovieItem(),
      separatorBuilder: (context,index) {
        return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.5),
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
      itemCount: 10);
  }
}