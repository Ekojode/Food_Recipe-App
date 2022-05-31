import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:food_app/widgets/meal_item.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Meal> favouriteMeals = [];
    return favouriteMeals.isEmpty
        ? const Center(
            child: Text("You currently have no Favourites!"),
          )
        : ListView.builder(
            itemCount: favouriteMeals.length,
            itemBuilder: (context, index) {
              return MealItem(
                  id: favouriteMeals[index].mealId,
                  color: Colors.pink,
                  name: favouriteMeals[index].name,
                  duration: favouriteMeals[index].duration,
                  imgUrl: favouriteMeals[index].imgUrl,
                  complexity: favouriteMeals[index].complexity,
                  affordability: favouriteMeals[index].affordability);
            });
  }
}
