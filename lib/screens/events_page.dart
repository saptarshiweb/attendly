import 'package:flutter/material.dart';

import '../widgets/menu_widget.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

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
          backgroundColor: Colors.blue,
          title: const Text('Upcoming Events'),
          leading: const MenuWidget(),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String) {
                    result = res;
                  }
                });
              },
              child: Text(result),
            ),
          ],
        )
        
        );
  }

  Widget event() {
    return Container(
      decoration: BoxDecoration(

      ),
      child: Column(
        children: [
          
        ],
      ),

    );
  }
}
