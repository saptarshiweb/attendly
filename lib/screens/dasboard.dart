import 'package:attendly/color_constants.dart';
import 'package:attendly/custom_widgets.dart';
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
      appBar: customAppBar('Dashboard', dashboardbgcolor),
      body: Container(color: dashboardbgcolor),
    );
  }
}
