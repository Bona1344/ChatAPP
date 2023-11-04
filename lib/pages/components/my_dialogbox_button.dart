import 'package:flutter/material.dart';

class DialogBoxButton extends StatelessWidget {
  final String buttonName;
  final void Function()? pressedButton;

  const DialogBoxButton(
      {super.key, required this.buttonName, required this.pressedButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressedButton,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            buttonName,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
