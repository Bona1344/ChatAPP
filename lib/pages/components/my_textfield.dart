import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  final TextEditingController controller;
  bool ispwvisible;
  final String textname;

  MyTextfield(
      {super.key,
      required this.controller,
      required this.ispwvisible,
      required this.textname});

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

bool _ob = false;

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.ispwvisible == false ? _ob : true,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.ispwvisible = !widget.ispwvisible;
              });
            },
            child: widget.ispwvisible == true
                ? Icon(
                    _ob ? Icons.visibility : Icons.visibility_off,
                    color: Colors.amber[900],
                  )
                : const Text("")),
        hintText: widget.textname,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
