import 'package:attendly/color_constants.dart';
import 'package:attendly/custom_widgets.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Help', helpbgcolor),
      body: const Text('Help Page'),
    );
  }
}
