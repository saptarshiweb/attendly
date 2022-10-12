import 'package:attendly/color_constants.dart';
import 'package:attendly/screens/qr_scanner/ticket_show.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:readmore/readmore.dart';
import 'package:slider_button/slider_button.dart';

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
            Expanded(flex: 3, child: upper(context)),
            Expanded(flex: 2, child: infowidget()),
            Expanded(flex: 2, child: aboutevent()),
            Expanded(flex: 1, child: registerbutton(context)),
          ],
        ),
      ),
    );
  }
}

Widget registerbutton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
    child: Row(
      children: [
        Expanded(
          child: SliderButton(
            buttonColor: t2,
            backgroundColor: eventcolor,
            baseColor: t2,
            highlightedColor: t1,
            buttonSize: 52,
            action: () {
              ///Do something here
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const TicketShow()));
            },
            label: Text(
              "Register for the event",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: t2, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            icon: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(
                FontAwesome5.angle_double_right,
                color: eventcolor,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget infowidget() {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16),
    child: Column(
      children: [
        const SizedBox(height: 25),
        Row(
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
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 16),
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
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: eventbgcolor2,
                  borderRadius: BorderRadius.circular(18)),
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
      ],
    ),
  );
}

Widget aboutevent() {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              'About Event',
              style: TextStyle(
                  color: t2, fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 15),
        ReadMoreText(
          'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
          trimLines: 2,
          style: TextStyle(
            color: t2,
            fontSize: 19,
          ),
          colorClickableText: Colors.pink,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read more',
          trimExpandedText: 'Read less',
          moreStyle: TextStyle(
              color: accent, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget upper(BuildContext context) {
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                  colors: [
                    Colors.deepPurpleAccent.shade100.withOpacity(0.8),
                    Colors.deepPurpleAccent.shade200.withOpacity(1),
                  ],
                  // colors: [Colors.grey.shade600, Colors.grey.shade800],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Entypo.left_open,
                color: t2,
                size: 34,
              ),
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                  colors: [
                    Colors.deepPurpleAccent.shade100.withOpacity(0.8),
                    Colors.deepPurpleAccent.shade200.withOpacity(1),
                  ],
                  // colors: [Colors.grey.shade600, Colors.grey.shade800],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Typicons.bookmark,
                color: t2,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
