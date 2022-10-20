import 'package:attendly/color_constants.dart';
import 'package:attendly/screens/home_page_main.dart';
import 'package:attendly/screens/qr_scanner/qr_scan.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketShow extends StatefulWidget {
  const TicketShow({super.key});

  @override
  State<TicketShow> createState() => _TicketShowState();
}

class _TicketShowState extends State<TicketShow> {
  late Image myImage;

  @override
  void initState() {
    super.initState();
    myImage = Image.asset('assets/gdsc_white.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(myImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Container(
        color: eventbgcolor,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 18, right: 14, top: 20, bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //headline
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: t2, width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          FontAwesome.left_open,
                          color: t2,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Event Ticket',
                    style: TextStyle(
                        color: t2, fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: t2, width: 1),
                          borderRadius: BorderRadius.circular(14)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesome.home,
                          color: t2,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //ticket widget
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ticketwidget(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ticketwidget() {
    return TicketWidget(
      color: Colors.purple.shade900,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      isCornerRounded: true,
      padding: const EdgeInsets.only(left: 18, top: 15, bottom: 14, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GDSC Info Session',
                    style: TextStyle(
                      color: t2,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'By Google Developer Students Club',
                    style: TextStyle(
                      color: t3,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const DottedLine(
            direction: Axis.horizontal,
            dashColor: Colors.grey,
          ),
          const SizedBox(height: 30),
          Text(
            '    Location',
            style: TextStyle(
              color: t3,
              fontSize: 17,
            ),
          ),
          Text(
            '    Seminar Hall, North Block',
            style: TextStyle(
              color: t2,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                      color: t3,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Saptarshi',
                    style: TextStyle(
                      color: t2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(
                      color: t3,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    '18 Nov 2022',
                    style: TextStyle(
                      color: t2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time',
                    style: TextStyle(
                      color: t3,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    '18:00 PM',
                    style: TextStyle(
                      color: t2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Dresscode',
                    style: TextStyle(
                      color: t3,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Casual',
                    style: TextStyle(
                      color: t2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: accent2),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const QrScan()));
              },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesome5.angle_double_right,
                      color: t2,
                      size: 24,
                    ),
                    Text(
                      "    Attend the event!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: t2, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
