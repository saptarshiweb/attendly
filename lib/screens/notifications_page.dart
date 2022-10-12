import 'package:attendly/color_constants.dart';
import 'package:attendly/custom_widgets.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppBar('Notifications', notificationbgcolor));
  }
}
