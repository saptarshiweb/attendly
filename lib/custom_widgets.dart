import 'package:attendly/color_constants.dart';
import 'package:attendly/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

// Color accent = Colors.orangeAccent.shade700;
Widget loadwidget() {
  return CircularProgressIndicator(
    color: accent2,
  );
}

Widget inputFile(
    {label, obscureText = false, required TextEditingController controller}) {
  return Padding(
    padding: const EdgeInsets.all(7),
    child: TextFormField(
      style: TextStyle(color: t1, fontWeight: FontWeight.bold),
      cursorHeight: 22,
      cursorColor: accent,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: accent2, width: 2)),
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade500),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.orangeAccent.shade700, width: 2),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400))),
    ),
  );
}

AppBar customAppBar(String text, Color col) {
  return AppBar(
    elevation: 0,
    backgroundColor: col,
    title: Text(
      text,
      style: TextStyle(color: t2, fontWeight: FontWeight.bold, fontSize: 24),
    ),
    leading: const MenuWidget(),
  );
}
