import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeal;
  var _loadedInitData = false;

  @override
  void initState() {
    print('initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
    print('didChangeDependencies');
      final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'];
      displayedMeal = widget.availableMeals
          .where((element) => element.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
            itemCount: displayedMeal.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: displayedMeal[index].id,
                title: displayedMeal[index].title,
                imageUrl: displayedMeal[index].imageUrl,
                duration: displayedMeal[index].duration,
                complexity: displayedMeal[index].complexity,
                affordability: displayedMeal[index].affordability,
              );
            }));
  }
}
