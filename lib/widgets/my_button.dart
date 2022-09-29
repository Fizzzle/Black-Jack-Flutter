import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.onPressed, required this.label});

  final Function onPressed;

  final String label;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        label,
        style: TextStyle(fontSize: 20),
      ),
      color: Colors.amber[200],
      onPressed: () => onPressed(),
    );
  }
}
