import 'package:flutter/material.dart';

import '../widgets/menu_widget.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent.shade400,
        title: const Text('Help'),
        leading: const MenuWidget(),
      ),
      body: const Text('Help Page'),
    );
  }
}
