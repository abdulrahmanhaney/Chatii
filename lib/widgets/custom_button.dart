import 'package:flutter/material.dart';

import '../consts.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, this.onTap});

  String? text;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(250, 50), shadowColor: KprimaryColor),
      child: Text(
        text!,
        style: const TextStyle(fontFamily: 'MyFont-Bold', fontSize: 18),
      ),
    );
  }
}
