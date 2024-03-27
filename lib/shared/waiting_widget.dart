import 'package:flutter/material.dart';
import 'package:movies/shared/constants.dart';

class WatingWidget extends StatelessWidget {
  const WatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
          color: Constants.whiteColor,
        ),
      );
  }
}