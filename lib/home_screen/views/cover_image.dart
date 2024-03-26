import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/constants.dart';
import 'package:movies/shared_widgets/waiting_widget.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width,
      child: CachedNetworkImage(
        imageUrl: '${Constants.baseImageUrl}$imgUrl',
        imageBuilder: (context, imageProvider) => Container(
          /*  width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4, */
          decoration: BoxDecoration(
            image: DecorationImage(
              matchTextDirection: true,
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
          child: Image.asset('assets/images/play_button.png'),
        ),
        placeholder: (context, url) => const WatingWidget(),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: Constants.whiteColor,
        ),
      ),
    );
  }
}
