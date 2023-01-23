import 'dart:ui';

import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(),
        FiltersScreen.routeName : (ctx) => FiltersScreen()
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
