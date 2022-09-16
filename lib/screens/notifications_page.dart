import 'package:flutter/material.dart';

import '../widgets/menu_widget.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.shade400,
        title: const Text('Notifications'),
        leading: const MenuWidget(),
      ),
    );
  }
}
