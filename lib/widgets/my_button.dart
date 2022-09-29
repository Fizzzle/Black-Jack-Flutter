import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.onPressed, required this.label, required this.size});

  final Function onPressed;

  final String label;

  final double size;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        label,
        style: TextStyle(fontSize: size),
      ),
      color: Colors.amber[200],
      onPressed: () => onPressed(),
    );
  }
}
