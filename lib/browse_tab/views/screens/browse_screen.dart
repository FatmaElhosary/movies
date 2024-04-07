import 'package:flutter/material.dart';
import 'package:movies/browse_tab/views/screens/category_item.dart';

class BrowseMovies extends StatelessWidget {
  static const String routeName = 'browse';
  const BrowseMovies({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
          body: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Browse Category',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
            child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2 / 1,
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) => CategoryItem(),
        ))
      ])),
    );
  }
}
