import 'package:flutter/material.dart';
import 'package:food_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.amberAccent),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.purple,
                  child: Text(
                    "EO",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Name: Oma-Victor Ekojode",
                  textAlign: TextAlign.start,
                ),
                Text("Email: ekojodeoma@gmail.com"),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant_menu,
              color: Colors.blueAccent,
            ),
            title: const Text("Meals"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.cyan),
            title: const Text("Filter"),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
