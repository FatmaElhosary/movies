import 'package:flutter/material.dart';
import 'package:movies/watched-tab/theme/custom_text_style.dart';
import 'package:movies/watched-tab/theme/theme_helper.dart';
import 'package:movies/watched-tab/views/widgets/custom_image_view.dart';
import 'package:movies/watched-tab/views/widgets/image_constant.dart';

// ignore: must_be_immutable
class watchedMovieItem extends StatelessWidget {
  const watchedMovieItem({Key? key})
      : super(
          key: key,
        );

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
                CustomImageView(
                  imagePath: ImageConstant.img,
                  height: 89,
                  radius: BorderRadius.circular(
                    4,
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 29),
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
                  "Alita Battle Angel",
                  style: CustomTextStyles.bodyMediumWhiteA700,
                ),
                SizedBox(height: 3),
                Text(
                  "2019",
                  style: theme.textTheme.bodyMedium,
                ),
                SizedBox(height: 5),
                Text(
                  "Rosa Salazar, Christoph Waltz",
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
