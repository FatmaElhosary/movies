import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies/shared/waiting_widget.dart';
import 'package:movies/home_tab/models/movie_details/movie_details.dart';
import 'package:movies/shared/constants.dart';
import 'package:movies/watched-tab/theme/custom_text_style.dart';
import 'package:movies/watched-tab/theme/theme_helper.dart';
import 'package:movies/watched-tab/views/widgets/custom_image_view.dart';
import 'package:movies/watched-tab/views/widgets/image_constant.dart';
import 'package:movies/watched-tab/watch_tab_provider.dart';

class WatchedMovieItem extends StatefulWidget {
  final MovieDetails movie;
  const WatchedMovieItem(this.movie, {super.key});

  @override
  State<WatchedMovieItem> createState() => _WatchedMovieItemState();
}

class _WatchedMovieItemState extends State<WatchedMovieItem> {
  var bookMarkedProvider = WatchListProvider();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 89,
            width: 140,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                CachedNetworkImage(
                  placeholder: (context, url) => const WatingWidget(),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.error,
                      color: Constants.whiteColor,
                    ),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  imageUrl:
                      '${Constants.baseImageUrl}${widget.movie.backdropPath}',
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 29),
                    child: InkWell(
                      onTap: () => deleteMovie(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgBookmarked,
                            width: 27,
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 16,
              bottom: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.movie.title!,
                  style: CustomTextStyles.bodyMediumWhiteA700,
                ),
                const SizedBox(height: 3),
                Text(
                  widget.movie.releaseDate!,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 5),
                // Text(
                //   "Rosa Salazar, Christoph Waltz",
                //   style: theme.textTheme.bodyMedium,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void deleteMovie() {
    bookMarkedProvider
        .deleteMovie(widget.movie)
        .timeout(const Duration(milliseconds: 500), onTimeout: () {
      print('deleted');

      Fluttertoast.showToast(
        msg: "The movie is deleted successfully",
        toastLength: Toast.LENGTH_SHORT,
      );
    }).catchError((_) {
      print('error');
      Fluttertoast.showToast(
        msg: "Ops, there was an error",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: appTheme.gray40001,
      );
    });
  }
}

// CustomImageView(
//                   imagePath: '${Constants.baseImageUrl}${widget.movie.posterPath}',
//                   height: 89,
//                   radius: BorderRadius.circular(
//                     4,
//                   ),
//                   alignment: Alignment.center,
//                 ),