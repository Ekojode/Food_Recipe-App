import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/lists/dummy_data.dart';
import 'package:food_app/screens/filters_screen.dart';
import 'package:food_app/screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './models/meal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "glutten": false,
    "vegan": false,
    "vegetarian": false,
    "lactose": false,
  };

  List<Meal> availableMeals = dummyMeals;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeals = dummyMeals.where((element) {
        if (_filters["glutten"] as bool && !element.isGlutenFree) {
          return false;
        }
        if (_filters["vegan"] as bool && !element.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] as bool && !element.isVegetarian) {
          return false;
        }
        if (_filters["lactose"] as bool && !element.isLactoseFree) {
          return false;
        }
        throw {};
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food App",
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.pink,
        //  canvasColor: Colors.grey,
        //  fontFamily: "Raleway",
        // colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.amber),
        /*  textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleLarge: const TextStyle(fontSize: 24)),*/
      ),
      home: const TabScreen(),
      routes: {
//"/tabscreen": (context) => const TabScreen(),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(
              availableMeals: availableMeals,
            ),
        MealDetailsScreen.routeName: (context) => const MealDetailsScreen(),
        FilterScreen.routeName: (context) =>
            FilterScreen(setfilters: _setFilters),
      },
    );
  }
}
