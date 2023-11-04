import 'package:firebase_auth_2/pages/auth/auth.dart';
import 'package:firebase_auth_2/pages/home_page.dart';
import 'package:firebase_auth_2/pages/profile_page.dart';
import 'package:firebase_auth_2/pages/theme/dark_mode.dart';
import 'package:firebase_auth_2/pages/theme/light_mode.dart';
import 'package:firebase_auth_2/pages/myusers_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '\home_page': (context) => const HomePage(),
        '\myusers_page': (context) => const UsersPage(),
        '\profile_page': (context) => const ProfilePage(),
      },
    );
  }
}
