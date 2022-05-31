import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function(Map<String, bool>) setfilters;
  const FilterScreen({Key? key, required this.setfilters}) : super(key: key);

  static const routeName = "/filterscreen";

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _gluttenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactorFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  widget.setfilters({
                    "glutten": _gluttenFree,
                    "vegan": _vegan,
                    "vegetarian": _vegetarian,
                    "lactose": _lactorFree
                  });
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Adjust yoour Meal Selection",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SwitchListTile(
                title: const Text("Glutten Free"),
                subtitle: const Text("Only include Glutten Free Meals"),
                value: _gluttenFree,
                onChanged: (newValue) {
                  setState(() {
                    _gluttenFree = newValue;
                  });
                }),
            SwitchListTile(
                title: const Text("Vegan"),
                subtitle: const Text("Only include Vegan Meals"),
                value: _vegan,
                onChanged: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
            SwitchListTile(
                title: const Text("Vegetarian"),
                subtitle: const Text("Only include Vegetarian Meals"),
                value: _vegetarian,
                onChanged: (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }
                // containedValue = newVal;
                ),
            SwitchListTile(
                title: const Text("Lactose Free"),
                subtitle: const Text("Only include Lactose Free Meals"),
                value: _lactorFree,
                onChanged: (newValue) {
                  setState(() {
                    _lactorFree = newValue;
                  });
                }
                // containedValue = newVal;
                )
          ],
        ));
  }
}
