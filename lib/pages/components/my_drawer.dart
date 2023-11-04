import 'package:auth/auth.dart';
import 'package:firebase_auth_2/pages/myusers_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
// logout function/method

  void Logout() {
    FirebaseAuth.instance.signOut();
  }

  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // drawer header
          Column(
            children: [
              DrawerHeader(
                  child: Icon(
                Icons.favorite,
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              )),
              //home list tile
              GestureDetector(
                onTap: () {
                  //since the drawer will only be accessible from homepage
                  //that means once you pop the drawer, it should always return back to the homepage.
                  //so we wont push a homepage scaffold over the drawer instead we will just pop the drawer.

                  Navigator.pop(context);
                },
                child: const ListTile(
                  leading: Icon(Icons.home),
                  title: Text("H O M E"),
                ),
              ),

              //users list tile
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '\myusers_page');
                },
                child: const ListTile(
                  leading: Icon(Icons.people),
                  title: Text("U S E R S"),
                ),
              ),

              // profile list tile
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '\profile_page');
                },
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text("P R O F I L E"),
                ),
              ),
            ],
          ),
          //log out
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ),
            child: GestureDetector(
              onTap: Logout,
              child: const ListTile(
                leading: Icon(Icons.logout),
                title: Text("L O G O U T"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
