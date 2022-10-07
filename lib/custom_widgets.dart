import 'package:flutter/material.dart';

Color accent = Colors.orangeAccent.shade700;

Widget inputFile(
    {label, obscureText = false, required TextEditingController controller}) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: TextFormField(
      cursorColor: accent,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.orangeAccent.shade700, width: 2),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400))),
    ),
  );
}
