import 'package:attendly/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../widgets/menu_widget.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  String result = 'Welcome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: eventbgcolor,
          title: const Center(child: Text('Events')),
          leading: const MenuWidget(),
        ),
        body: Container(
          color: eventbgcolor,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 12),
            child: Column(
              children: [
                upcoming(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }

  Widget upcoming() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: eventbgcolor2),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Upcoming Events',
              style: TextStyle(
                  color: t2, fontSize: 19, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Icon(
              FontAwesome.down_open,
              color: t2,
              size: 18,
            )
          ],
        ),
      ),
    );
  }

  Widget eventlist() {
    return Container(
      decoration: BoxDecoration(color: eventbgcolor.withOpacity(0.7)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
