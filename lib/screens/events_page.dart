import 'package:attendly/color_constants.dart';
import 'package:attendly/custom_widgets.dart';
import 'package:attendly/screens/qr_scanner/specific_event.dart';
import 'package:attendly/screens/qr_scanner/ticket_show.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
//EventRegister
//EventAttend

  bool attend = false, register = false;
  checkregister() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? token = prefs.getBool("EventAttend");
    final bool? token2 = prefs.getBool("EventRegister");

    if (token == true) attend = true;
    if (token2 == true) register = true;
  }

  String result = 'Welcome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar('Events', eventbgcolor),
        body: FutureBuilder(
          future: checkregister(),
          builder: ((context, snapshot) {
            return Container(
              color: eventbgcolor,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 12),
                child: Column(
                  children: [
                    upcoming(),
                    const SizedBox(height: 20),
                    eventlist(),
                  ],
                ),
              ),
            );
          }),
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
      decoration: BoxDecoration(
        color: eventbgcolor2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: const Image(
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/gdsc_white.png')),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  FontAwesome5.code,
                  color: accent2,
                  size: 25,
                ),
                Text(
                  '     GDSC Info Session',
                  style: TextStyle(
                      color: t2, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                (attend == false)
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const SpecificEvent()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: eventbgcolor,
                        ),
                        child: Text(
                          'Details',
                          style: TextStyle(color: t2),
                        ))
                    : const SizedBox(height: 0, width: 0),
              ],
            ),
            const SizedBox(height: 7),
            (attend == false && register == true)
                ? Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: eventbgcolor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'You are Registered for this event.',
                                    style: TextStyle(
                                        color: t2,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const TicketShow()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: accent2,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Attend the event ',
                                        style: TextStyle(
                                            color: t2,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Iconic.right_circle,
                                        color: t2,
                                        size: 22,
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  )
                : const SizedBox(height: 0, width: 0),
            (attend == true)
                ? Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: eventbgcolor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'You are attending this event.',
                                style: TextStyle(
                                    color: t2,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ],
                  )
                : const SizedBox(height: 0, width: 0),
          ],
        ),
      ),
    );
  }
}
