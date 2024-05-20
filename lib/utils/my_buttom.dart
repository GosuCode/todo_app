import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.greenAccent[400],
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}
