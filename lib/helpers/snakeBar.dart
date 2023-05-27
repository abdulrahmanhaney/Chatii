import 'package:flutter/material.dart';

void ShowSnakeBar(BuildContext context, {required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(fontFamily: "MyFont-Bold "),
      ),
    ),
  );
}
