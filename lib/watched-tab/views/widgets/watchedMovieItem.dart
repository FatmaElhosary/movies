// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:movies/home_tab/models/movie_details/movie_details.dart';
import 'package:movies/shared/constants.dart';
import 'package:movies/watched-tab/data/firebase_utils.dart';
import 'package:movies/watched-tab/theme/custom_text_style.dart';
import 'package:movies/watched-tab/theme/theme_helper.dart';
import 'package:movies/watched-tab/views/widgets/custom_image_view.dart';
import 'package:movies/watched-tab/views/widgets/image_constant.dart';
import 'package:movies/watched-tab/watchTab_provider.dart';

// ignore: must_be_immutable
class watchedMovieItem extends StatefulWidget {
  final MovieDetails movie;
   watchedMovieItem(this.movie);

  @override
  State<watchedMovieItem> createState() => _watchedMovieItemState();
}

class _watchedMovieItemState extends State<watchedMovieItem> {
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
                CachedNetworkImage
                (
                  imageUrl: '${Constants.baseImageUrl}${widget.movie.posterPath}',
                  height: 89,
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 29),
                    child: InkWell(
                      onTap: (){},
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgBookmarked,
                              width: 27,
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
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
                SizedBox(height: 3),
                Text(
                  widget.movie.releaseDate!,
                  style: theme.textTheme.bodyMedium,
                ),
                SizedBox(height: 5),
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

   void deleteMovie(BuildContext context){
    FirebaseUtils.deleteMovieFromFirestore(widget.movie.id as String)
    .timeout(
    const Duration(milliseconds: 500),
    onTimeout:(){
      Provider.of <WatchlistProvider>(context,listen: false).getMovies();
      print('success');
      setState(() {});
      Fluttertoast.showToast(
        msg: "The movie is deleted successfully",
        toastLength: Toast.LENGTH_SHORT,
    );
    }
  ).catchError((_){
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