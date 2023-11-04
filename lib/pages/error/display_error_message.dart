import 'package:firebase_auth_2/pages/components/my_button.dart';
import 'package:firebase_auth_2/pages/components/my_dialogbox.dart';
import 'package:firebase_auth_2/pages/components/my_dialogbox_button.dart';
import 'package:flutter/material.dart';

void displayErrorMessage(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(message),
        content: Container(
          child: MyButton(
              buttonName: "Okay",
              pressedButton: () {
                Navigator.pop(context);
              }),
        ),
      );
    },
  );
}
