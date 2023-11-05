import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_2/pages/components/my_button.dart';
import 'package:firebase_auth_2/pages/components/my_dialogbox.dart';
import 'package:firebase_auth_2/pages/components/my_textfield.dart';
import 'package:firebase_auth_2/pages/error/display_error_message.dart';
import 'package:firebase_auth_2/pages/home_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? tapToLogin;

  const RegisterPage({super.key, required this.tapToLogin});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _confirmpwController = TextEditingController();

  void registerUser() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //CONFIRMING PASSWORD

    //if the password don't match, pop the loading circle first and display an errorMessage.

    if (_pwController.text != _confirmpwController.text) {
      //pop the loading circle first
      Navigator.pop(context);

      // then display a message on a dialog box showing "password doesn't match"
      displayErrorMessage("Password Don't Match!", context);
    }

    // if the password match, create the user
    else {
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text, password: _pwController.text);

        //create a document and add it to the firestore
        createUserDocuments(userCredential);

        //pop the loading circle first
        Navigator.pop(context);

        // then Navigate to home page
        Navigator.pushNamed(context, '\home_page');
      } on FirebaseException catch (e) {
        //pop the loading circle first
        Navigator.pop(context);

        // display the error
        displayErrorMessage(e.code, context);
      }
    }
  }

//create user documents and collect them in firestore
  Future<void> createUserDocuments(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(userCredential.user!.email)
          .set({
        "username": _usernameController.text,
        "email": _emailController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // create an icon
              Center(
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              //Welcome back Text
              const Text(
                "R E G I S T E R   N O W",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),

              //Fullname textfield with icon for obscurity
              MyTextfield(
                  controller: _usernameController,
                  ispwvisible: false,
                  textname: "Full name"),

              const SizedBox(
                height: 10,
              ),

              //username textfield with icon for obscurity
              MyTextfield(
                  controller: _emailController,
                  ispwvisible: false,
                  textname: "Email"),
              const SizedBox(
                height: 10,
              ),
              //email textfield
              MyTextfield(
                  controller: _pwController,
                  ispwvisible: true,
                  textname: "Password"),
              const SizedBox(
                height: 10,
              ),

              //pasword textfield with icon for obscurity
              MyTextfield(
                  controller: _confirmpwController,
                  ispwvisible: true,
                  textname: "Confirm Password"),
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
                buttonName: "Sign Up",
                pressedButton: registerUser,
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
                    "Already have an account?",
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
                    onTap: widget.tapToLogin,
                    child: const Text(
                      "Login Now",
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
