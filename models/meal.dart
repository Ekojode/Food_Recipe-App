enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  cheap,
  moderate,
  expensive,
}

class Meal {
  final String name;
  final String mealId;
  final List<String> mealCategories;
  final String imgUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.isVegetarian,
    required this.mealId,
    required this.mealCategories,
    required this.imgUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.name,
  });
}
