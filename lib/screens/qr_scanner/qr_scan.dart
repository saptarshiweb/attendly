import 'package:attendly/color_constants.dart';
import 'package:attendly/screens/home_page_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class QrScan extends StatefulWidget {
  const QrScan({super.key});

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  String result = "Sorry, Try again";
  bool isscan = false;
  bool correctqr = false;

  String correctId = 'helloworld';
  scanresult() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? token = prefs.getBool("EventAttend");

    if (token == true) {
      correctqr = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: eventbgcolor,
        leading: null,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Typicons.left_open_outline,
                color: t2,
                size: 20,
              ),
            ),
            Text(
              'Scan QR',
              style: TextStyle(
                  color: t2, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pop(context);
              },
              child: Icon(
                MfgLabs.help_circled_alt,
                color: t2,
                size: 28,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: scanresult(),
        builder: ((context, snapshot) {
          if (correctqr == true) {
            return qrSuccess();
          } else if (isscan == true) {
            return qrfail();
          } else {
            return qrfirstTime();
          }
        }),
      ),
    );
  }

  Widget qrSuccess() {
    return Container(
      color: eventbgcolor,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 30, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            qrwidget(),
            const SizedBox(height: 25),
            Text(
              'QR Code Scan Success!',
              style: TextStyle(
                  color: t2, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              'Attendance Confirmed.',
              style: TextStyle(
                  color: t2, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: accent2),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesome.left_open,
                            color: t2,
                            size: 22,
                          ),
                          Text(
                            '  Back to Home Page',
                            style: TextStyle(
                                color: t2,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget qrfirstTime() {
    return Container(
      color: eventbgcolor,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 30, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            qrwidget(),
            const SizedBox(height: 25),
            Text(
              'Scan QR Code to confirm',
              style: TextStyle(
                  color: t2, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              'Attendance',
              style: TextStyle(
                  color: t2, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: accent2),
                    onPressed: () async {
                      var res = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SimpleBarcodeScannerPage(),
                          ));
                      setState(() {
                        isscan = true;
                        if (res is String) {
                          result = res;
                        }
                      });

                      if (res == correctId) {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('EventAttend', true);
                        await prefs.setBool('EventRegister', true);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Scan QR',
                        style: TextStyle(
                            color: t2,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget qrfail() {
    return Container(
      color: eventbgcolor,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 30, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            qrwidget(),
            const SizedBox(height: 25),
            Text(
              'Sorry QR did not match.',
              style: TextStyle(
                  color: t2, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              'Try again.',
              style: TextStyle(
                  color: t2, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: accent2),
                    onPressed: () async {
                      var res = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SimpleBarcodeScannerPage(),
                          ));
                      setState(() {
                        if (res is String) {
                          result = res;
                        }
                      });
                      if (res == correctId) {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('EventAttend', true);
                        await prefs.setBool('EventRegister', true);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Scan QR',
                        style: TextStyle(
                            color: t2,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget qrwidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(colors: [
            eventbgcolor2,
            eventbgcolor2.withOpacity(0.7),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: PrettyQr(
          elementColor: t2,
          data: '',
        ),
      ),
    );
  }
}
