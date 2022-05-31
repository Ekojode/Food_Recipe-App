import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import '../widgets/meal_item.dart';
import '../lists/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  final List<Meal> availableMeals;
  const CategoryMealScreen({Key? key, required this.availableMeals})
      : super(key: key);

  static const routeName = "/category_meals";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final cattitle = routeArgs["title"];
    final catid = routeArgs["id"];
    final catcolor = routeArgs["color"];
    final filteredMeal = availableMeals.where(
      (element) {
        return element.mealCategories.contains(catid);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: catcolor as Color,
        title: Text(cattitle! as String),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            id: filteredMeal[index].mealId,
            color: catcolor,
            name: filteredMeal[index].name,
            duration: filteredMeal[index].duration,
            imgUrl: filteredMeal[index].imgUrl,
            complexity: filteredMeal[index].complexity,
            affordability: filteredMeal[index].affordability,
          );
        },
        itemCount: filteredMeal.length,
      ),
    );
  }
}
