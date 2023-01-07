import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/category_item.dart';
import 'package:mealsapp/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
          ),
          children: DUMMY_CATEGORIES.map((el) => CategoryItem(el.id, el.title, el.color)).toList()
    );
  }
}
