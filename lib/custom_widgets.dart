import 'package:attendly/color_constants.dart';
import 'package:attendly/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

Color accent = Colors.orangeAccent.shade700;
Widget loadwidget() {
  return CircularProgressIndicator(
    color: accent2,
  );
}

Widget inputFile(
    {label, obscureText = false, required TextEditingController controller}) {
  return Padding(
    padding: const EdgeInsets.all(7),
    child: Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0, 2),
                spreadRadius: 2,
                blurRadius: 1)
          ],
          color: Colors.grey.shade200.withOpacity(0.8),
          borderRadius: BorderRadius.circular(3)),
      child: TextFormField(
        style: TextStyle(color: t1, fontWeight: FontWeight.bold),
        cursorHeight: 22,
        cursorColor: accent,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey.shade500),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.orangeAccent.shade700, width: 2),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400))),
      ),
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
