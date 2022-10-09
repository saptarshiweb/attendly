import 'package:attendly/screens/home_page_main.dart';
import 'package:attendly/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'lato'),
    debugShowCheckedModeBanner: false,
    home: const StartWidget(),

    // home: const HomePage(),
  ));
}

class StartWidget extends StatelessWidget {
  const StartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool go = false;
    checkToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool? token = prefs.getBool("signIn");
      if (token == true) {
        go = true;
      }
    }

    // checkToken();

    // return const LoginScreen();

    return Scaffold(
      body: FutureBuilder(
          future: checkToken(),
          builder: ((context, snapshot) {
            if (go) return const HomePage();
            return const LoginScreen();
          })),
    );
  }
}
