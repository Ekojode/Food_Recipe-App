import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color catcolor;
  const CategoryItem(
      {Key? key, required this.title, required this.catcolor, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CategoryMealScreen.routeName,
            arguments: {"id": id, "title": title, "color": catcolor});
      },
      splashColor: Colors.blue,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [catcolor.withOpacity(0.7), catcolor]),
            borderRadius: BorderRadius.circular(15)),
        child: Align(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // textAlign: Alignment.center,
          ),
        ),
      ),
    );
  }
}
