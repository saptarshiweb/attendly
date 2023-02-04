import 'package:attendly/models/menu_item.dart';
import 'package:attendly/screens/contact_us.dart';
import 'package:attendly/screens/dasboard.dart';
import 'package:attendly/screens/events_page.dart';
import 'package:attendly/screens/help_page.dart';
import 'package:attendly/screens/menu_screen.dart';
import 'package:attendly/screens/notifications_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../color_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  MenuItem1 currentItem = MenuItems.event;

  @override
  Widget build(BuildContext context) => ZoomDrawer(
      style: DrawerStyle.defaultStyle,
      
      borderRadius: 20,
      showShadow: true,
      drawerShadowsBackgroundColor: accent,
      menuBackgroundColor: drawercolor,
      angle: -10,
      slideWidth: MediaQuery.of(context).size.width * 0.75,
      mainScreen: getScreen(),
      menuScreen: Builder(
        builder: (context) => MenuPage(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() {
                currentItem = item;
              });
              ZoomDrawer.of(context)!.close();
            }),
      ));

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.dashboard:
        return const Dashboard();

      case MenuItems.event:
        return const EventPage();

      case MenuItems.noti:
        return const Notifications();

      case MenuItems.help:
        return const HelpPage();

      case MenuItems.contact:
        return const ContactUs();

      default:
        return const Dashboard();
    }
  }
}
