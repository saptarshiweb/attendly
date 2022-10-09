import 'package:attendly/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attendly/models/menu_item.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'package:carbon_icons/carbon_icons.dart';

//all drawer Items present here

class MenuItems {
  static const dashboard =
      MenuItem1('Dashboard', CarbonIcons.dashboard_reference);
  static const event = MenuItem1('Event', CarbonIcons.event_schedule);
  static const noti = MenuItem1('Notifications', CarbonIcons.notification_new);
  static const help = MenuItem1('Help', CarbonIcons.help_desk);
  static const contact = MenuItem1('Contact Us', CarbonIcons.mail_all);

  static const all = <MenuItem1>[dashboard, event, noti, help, contact];
}

class MenuPage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  String UserName = '';

  Future getname() async {
    final prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('Name');

    UserName = name!;
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('signIn', false);
  }

  final MenuItem1 currentItem;
  final ValueChanged<MenuItem1> onSelectedItem;
  MenuPage({Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          backgroundColor: drawercolor,
          body: FutureBuilder(
            future: getname(),
            builder: ((context, snapshot) {
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        profilewidget(),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(UserName),
                    ),
                    ...MenuItems.all.map(buildMenuItem).toList(),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: GestureDetector(
                        onTap: () {
                          logout();
                          Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Row(
                          children: const [
                            Icon(CarbonIcons.logout,
                                color: Colors.black, size: 24),
                            Text(
                              '  Sign Out',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              );
            }),
          ),
        ));
  }

  Widget profilewidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              accent.withOpacity(0.4),
              accent.withOpacity(0.5),
              accent.withOpacity(0.6),
              accent.withOpacity(0.8),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius:
                const BorderRadius.only(topLeft: Radius.circular(18))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                child: Lottie.asset('assets/dsc.json'),
              ),
              const SizedBox(height: 20),
              Text(
                UserName,
                style: TextStyle(
                    color: t1, fontWeight: FontWeight.bold, fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItem1 item) => ListTileTheme(
        selectedColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 14),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            selectedTileColor: accent.withOpacity(0.3),
            iconColor: Colors.grey.shade900,
            selected: currentItem == item,
            minLeadingWidth: 20,
            leading: Icon(item.icon),
            title: Text(
              item.title,
              style: TextStyle(color: Colors.grey.shade900),
            ),
            onTap: () {
              onSelectedItem(item);
            },
          ),
        ),
      );
}
