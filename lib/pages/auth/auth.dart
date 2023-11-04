import 'package:auth/auth.dart';
import 'package:firebase_auth_2/pages/auth/login_or_register.dart';
import 'package:firebase_auth_2/pages/home_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is signed in
          if (snapshot.hasData) {
            return const HomePage();
          }
          //user is not signed in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
