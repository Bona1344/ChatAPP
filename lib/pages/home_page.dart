import 'package:auth/auth.dart';
import 'package:firebase_auth_2/pages/components/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Colors.amber[900],
          elevation: 0,
          title: const Center(
            child: Text(
              "H O M E    P A G E",
            ),
          ),
        ),
        drawer: MyDrawer());
  }
}
