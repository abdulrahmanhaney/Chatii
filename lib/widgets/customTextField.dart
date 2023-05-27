import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key, required this.icon, required this.hint, this.onChanged});

  IconData icon;
  String hint;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "${hint.toUpperCase()} Cant Be Empty";
          }
          return null;
        },
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14, fontFamily: "MyFont-Medium"),
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontFamily: "MyFont-Medium"),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14, fontFamily: "MyFont-Medium"),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Icon(
              icon,
              size: 24,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
