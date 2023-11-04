import 'package:firebase_auth_2/pages/components/my_dialogbox_button.dart';
import 'package:flutter/material.dart';

class MyDialogBox extends StatelessWidget {
  final String dialogtext;

  const MyDialogBox({super.key, required this.dialogtext});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Theme.of(context).colorScheme.background,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Alert message
            Center(
              child: Text(
                dialogtext,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ),

            // okay button here
            DialogBoxButton(
              pressedButton: () {
                Navigator.pop(context);
              },
              buttonName: "Okay",
            )
          ],
        ),
      ),
    );
  }
}
