import 'package:flutter/material.dart';
import 'package:mealsapp/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget _buildListTitle(String text, IconData icon, VoidCallback tabHandler) {
    return ListTile(
      leading: Icon(icon, size: 26,),
      title: Text(text,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding : const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text('Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary
              )),
          ),
          const SizedBox(height: 20),
          _buildListTitle(
              'Meals',
              Icons.restaurant,
              (){
                Navigator.of(context).pushReplacementNamed('/');
              }
          ),
          _buildListTitle(
              'Filters',
              Icons.settings,
              (){
                Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              }
          )
        ],
      ),
    );
  }
}
