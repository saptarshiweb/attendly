import 'package:attendly/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fluttericon/iconic_icons.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => ZoomDrawer.of(context)!.toggle(),
      icon: Icon(
        Iconic.list,
        color: t2,
        size: 24,
      ),
    );
  }
}
