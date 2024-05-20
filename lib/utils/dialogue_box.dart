import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_buttom.dart';

class DialogueBox extends StatelessWidget {
  final dynamic controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogueBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Colors.black87,
      content: SizedBox(
        height: screenHeight * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.greenAccent[400],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "Add",
                  onPressed: onSave,
                ),
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
