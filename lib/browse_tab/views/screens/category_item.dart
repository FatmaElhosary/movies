import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 158,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/category_item.png',
          ),
          Center(
              child:
                  Text('Action', style: Theme.of(context).textTheme.bodySmall))
        ],
      ),
    );
  }
}
