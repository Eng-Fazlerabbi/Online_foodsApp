
import 'package:flutter/material.dart';
import 'package:mealsapp/Widgets/meal_Item.dart';
import 'package:mealsapp/model/Meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal>favoriteMeals;
  FavouriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }else{
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (BuildContext contex, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
            );
          }
      );

    }
  }
}
