import 'package:attendly/color_constants.dart';
import 'package:attendly/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: dashboardbgcolor,
        title: const Text('Dashboard'),
        leading: const MenuWidget(),
      ),
      body: Container(color: dashboardbgcolor),
    );
  }
}
