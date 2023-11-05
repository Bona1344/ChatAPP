import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //removing app bar elevation so it will be flat w/o shawdows
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Center(
          child: Text("P R O F I L E"),
        ),
      ),
    );
  }
}
