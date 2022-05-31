import 'package:flutter/material.dart';
import 'package:food_app/screens/meal_details_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final Color color;
  final String name;
  final int duration;
  final String imgUrl;
  final Complexity complexity;
  final Affordability affordability;
  const MealItem(
      {Key? key,
      required this.id,
      required this.color,
      required this.name,
      required this.duration,
      required this.imgUrl,
      required this.complexity,
      required this.affordability})
      : super(key: key);

  String get complexityLevel {
    switch (complexity) {
      case Complexity.simple:
        return 'Easy';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
    }
  }

  String get affordabilityPrice {
    switch (affordability) {
      case Affordability.cheap:
        return 'Cheap';
      case Affordability.moderate:
        return 'Moderate';
      case Affordability.expensive:
        return 'Expensive';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.of(context).pushNamed(MealDetailsScreen.routeName,
            arguments: {"id": id, "color": color});
      }),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 8,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imgUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 80,
                  left: MediaQuery.of(context).size.width * 0.04,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    color: Colors.black12,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Center(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 2),
                      Text("$duration minutes")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 2),
                      Text(complexityLevel)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 2),
                      Text(affordabilityPrice)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
