import 'package:flutter/material.dart';
import 'package:food_app/screens/favourites_screen.dart';
import 'package:food_app/widgets/main_drawer.dart';
import './categories_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPage = 0;

  void onPageSelect(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  final pages = [
    const CategoriesScreen(),
    const FavouritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kide Foods"),
        centerTitle: true,
        /*     bottom: const TabBar(
          indicatorColor: Colors.pink,
          tabs: [
            Tab(
              icon: Icon(Icons.category_outlined),
              child: Text("Categories"),
            ),
            Tab(
              icon: Icon(Icons.favorite),
              child: Text("Favourites"),
            ),
          ],
        ), */
      ),
      drawer: const MainDrawer(),
      body: pages.elementAt(_selectedPage),
      /* body: const TabBarView(children: [
        CategoriesScreen(),
        Center(
          child: Text("Favourites"),
        )
      ]),*/
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourites",
          )
        ],
        selectedItemColor: Colors.pink,
        onTap: onPageSelect,
        elevation: 2,
        currentIndex: _selectedPage,
      ),
    );
  }
}
