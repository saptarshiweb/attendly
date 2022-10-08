import 'dart:convert';

import 'package:attendly/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attendly/models/menu_item.dart';
import 'package:http/http.dart' as http;

import 'login_screen.dart';

//all drawer Items present here

class MenuItems {
  static const dashboard = MenuItem1('Dashboard', Icons.dashboard);
  static const event = MenuItem1('Event', Icons.event);
  static const noti = MenuItem1('Notifications', Icons.notifications);
  static const help = MenuItem1('Help', Icons.help);
  static const contact = MenuItem1('Contact Us', Icons.contact_page_rounded);

  static const all = <MenuItem1>[dashboard, event, noti, help, contact];
}

class MenuPage extends StatelessWidget {
  final MenuItem1 currentItem;
  final ValueChanged<MenuItem1> onSelectedItem;
  MenuPage({Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);
  String name = 'Sample';
  String url = 'https://attendly-backend.vercel.app/api/logout';
  ProfileLoggedIn profile = ProfileLoggedIn(
      isAuth: false,
      id: '123',
      email: 'dsd',
      name: 'sample',
      eventregister: false,
      eventattend: false);

  Future _profilefetch() async {
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    // print(response.body);
    // profile = json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark(),
        child: Scaffold(
            backgroundColor: Colors.indigo,
            // body: FutureBuilder(
            //   future: _profilefetch(),
            //   builder: ((context, snapshot) {
            //     if (snapshot.hasData) {
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        _profilefetch();
                      },
                      child: const Text('Profile')),
                  Text(profile.name),
                  ...MenuItems.all.map(buildMenuItem).toList(),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _profilefetch();

                          Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: const [
                                Text(
                                  'Logout  ',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Icon(Icons.logout_outlined,
                                    color: Colors.white, size: 20)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            )));
  }

  Widget buildMenuItem(MenuItem1 item) => ListTileTheme(
        selectedColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            selectedTileColor: Colors.black26,
            selected: currentItem == item,
            minLeadingWidth: 20,
            leading: Icon(item.icon),
            title: Text(item.title),
            onTap: () {
              onSelectedItem(item);
            },
          ),
        ),
      );
}
