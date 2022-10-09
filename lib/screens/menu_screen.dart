import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attendly/models/menu_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
// WB98K0765
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
          backgroundColor: Colors.indigo,
          body: FutureBuilder(
            future: getname(),
            builder: ((context, snapshot) {
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(UserName),
                    ),
                    ...MenuItems.all.map(buildMenuItem).toList(),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            logout();
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
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
                      ],
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              );
            }),
          ),
        ));
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
