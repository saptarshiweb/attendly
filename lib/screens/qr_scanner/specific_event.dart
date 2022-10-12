import 'package:attendly/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';

class SpecificEvent extends StatefulWidget {
  const SpecificEvent({super.key});

  @override
  State<SpecificEvent> createState() => _SpecificEventState();
}

class _SpecificEventState extends State<SpecificEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0, elevation: 0),
      body: Container(
        color: eventbgcolor,
        child: Column(
          children: [
            Expanded(flex: 8, child: upper()),
            Expanded(flex: 2, child: infowidget()),
          ],
        ),
      ),
    );
  }
}

Widget infowidget() {
  return Padding(
    padding: const EdgeInsets.only(left: 12, right: 12),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'GDSC Info-Session  ',
                  style: TextStyle(
                      color: t2, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Icon(
                  FontAwesome.empire,
                  color: t2,
                  size: 26,
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'By Google Developer Student Clubs',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Typicons.location,
                  color: Colors.deepOrangeAccent.shade200,
                  size: 22,
                ),
                const SizedBox(width: 2),
                Text(
                  ' Kalyani, Nadia',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                ),
                const SizedBox(width: 2),
                Icon(
                  FontAwesome.clock,
                  color: Colors.deepOrangeAccent.shade200,
                  size: 22,
                ),
                const SizedBox(width: 2),
                Text(
                  ' 18:00 PM - 22:00 PM',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                ),
              ],
            )
          ],
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
              color: eventbgcolor2, borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  'NOV',
                  style: TextStyle(
                    color: t2,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '18',
                  style: TextStyle(
                      color: Colors.orangeAccent.shade400,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget aboutevent() {
  return Column(
    children: const [],
  );
}

Widget upper() {
  return Container(
    constraints: const BoxConstraints.expand(),
    decoration: const BoxDecoration(
        image: DecorationImage(
      fit: BoxFit.fitWidth,
      image: AssetImage('assets/gdsc_black.png'),
    )),
    child: Padding(
      padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesome5.arrow_circle_left,
              color: t2,
              size: 28,
            ),
          ),
        ],
      ),
    ),
  );
}
