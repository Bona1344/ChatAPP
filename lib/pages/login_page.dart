import 'package:auth/auth.dart';
import 'package:firebase_auth_2/pages/components/my_button.dart';
import 'package:firebase_auth_2/pages/components/my_textfield.dart';
import 'package:firebase_auth_2/pages/error/display_error_message.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? tapToRegister;

  const LoginPage({super.key, required this.tapToRegister});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  void login() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    //try to sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _pwController.text);

      // pop loading circle
      if (context.mounted) Navigator.pop(context);
    }
    // display error if any

    on FirebaseException catch (e) {
      Navigator.pop(context);

      displayErrorMessage(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        // create
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // create an icon
              Center(
                child: Icon(
                  Icons.lock,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //Welcome back Text
              const Text(
                "S I G N I N    N O W",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              //email textfield
              MyTextfield(
                  controller: _emailController,
                  ispwvisible: false,
                  textname: "Email"),
              const SizedBox(
                height: 10,
              ),

              //pasword textfield with icon for obscurity
              MyTextfield(
                  controller: _pwController,
                  ispwvisible: true,
                  textname: "Password"),
              //forgotten password

              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgotten Password?"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              //sign in button
              MyButton(
                pressedButton: login,
                buttonName: "Sign In",
              ),
              const SizedBox(
                height: 20,
              ),
              //Don't have an account, Register Now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //already have an account
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  //register now
                  GestureDetector(
                    onTap: widget.tapToRegister,
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
