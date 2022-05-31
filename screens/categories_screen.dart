import 'package:flutter/material.dart';
import '../widgets/category_item.dart';

import '../lists/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /* Scaffold(
        appBar: AppBar(
        title: const Text("Kide Foods"),
        centerTitle: true,
      ),
      body: */
        GridView.count(
      padding: const EdgeInsets.all(25),
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: dummyCategories.map((e) {
        return CategoryItem(title: e.title, catcolor: e.colour, id: e.id);
      }).toList(),
    );
  }
}
