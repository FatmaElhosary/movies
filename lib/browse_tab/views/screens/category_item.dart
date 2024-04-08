import 'package:flutter/material.dart';
import 'package:movies/home_tab/models/movie_details/genre.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.genre});
  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 158,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/category_item.png',
            opacity: const AlwaysStoppedAnimation(.5),
          ),
          Text(genre.name ?? 'Actions',
              style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }
}
