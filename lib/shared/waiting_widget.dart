import 'package:flutter/material.dart';
import 'package:movies/shared/constants.dart';

class WatingWidget extends StatelessWidget {
  const WatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Constants.blackColor,
          image: DecorationImage(
              image: AssetImage(
            'assets/images/movies.png',
          ))),
      child: const CircularProgressIndicator(
        color: Constants.whiteColor,
      ),
    );
  }
}
