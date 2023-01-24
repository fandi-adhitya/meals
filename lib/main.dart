import 'dart:ui';

import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten'      : false,
    'lactose'     : false,
    'vegan'       : false,
    'vegetarian'  : false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((el) {
        if(_filters['gluten'] as bool && !el.isGlutenFree) {
          return false;
        }
        if(_filters['lactose'] as bool && !el.isLactoseFree) {
          return false;
        }
        if(_filters['vegan'] as bool && !el.isVegan) {
          return false;
        }
        if(_filters['vegetarian'] as bool && !el.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: theme.textTheme.apply(
          fontFamily: 'Raleway'
        )
        .copyWith(
          bodySmall: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
          ),
          bodyMedium: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
          ),
          titleSmall: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )
        )
      ),
      initialRoute: '/',
      routes : {
        '/' : (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(),
        FiltersScreen.routeName : (ctx) => FiltersScreen(_filters, _setFilters)
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == '/something-else') {
        //   return ...
        // } else if (settings.name == '/something-else') {
        //   return ...
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!')
      ),
    );
  }
}
