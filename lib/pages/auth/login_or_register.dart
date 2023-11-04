import 'package:firebase_auth_2/pages/login_page.dart';
import 'package:firebase_auth_2/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initial show log in page
  bool showLoginPage = true;

//toggle function which toggles between login and  register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage == true) {
      return LoginPage(tapToRegister: togglePages);
    } else {
      return RegisterPage(tapToLogin: togglePages);
    }
  }
}
