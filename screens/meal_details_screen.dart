import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import '../lists/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({Key? key}) : super(key: key);

  static const routeName = "/mealdetail";

  /* addFavourite (String foodid){
    final Meal favourite = dummyMeals.firstWhere((element){
     return element.mealId.contains(foodid);
    });

  }
*/
  @override
  Widget build(BuildContext context) {
    final List<Meal> newmeal = [];
    final screenHeight = (MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top);

    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final mealcolor = routeArgs["color"];
    final mealId = routeArgs["id"];
    final selectedMeal = dummyMeals.firstWhere(
      (element) {
        return element.mealId.contains(mealId as String);
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.name),
        centerTitle: true,
        backgroundColor: mealcolor as Color,
        actions: [
          PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.yellow,
              ),
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: ListTile(
                        //   onTap: addFavourite,
                        leading: Icon(Icons.star),
                        title: Text("Add to Favourites"),
                      ),
                    )
                  ])
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: Colors.amberAccent,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              height: screenHeight * 0.4,
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  selectedMeal.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
              child: const Center(
                child: Text(
                  "Ingredients",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  )),
              height: screenHeight * 0.22,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              padding: const EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.yellow,
                      // elevation: 2,
                      child: Text(
                        "${index + 1} ${selectedMeal.ingredients[index]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: screenHeight * 0.05,
              child: const Center(
                child: Text(
                  "Steps",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  )),
              height: screenHeight * 0.25,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              padding: const EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.pink,
                            child: Text(
                              "${index + 1}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        const Divider(),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
