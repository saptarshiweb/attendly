import 'dart:convert';

import 'package:attendly/models/user_model.dart';
import 'package:attendly/screens/home_page_main.dart';
import 'package:attendly/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'lato'),
    debugShowCheckedModeBanner: false,
    home: const StartWidget(),

    // home: const HomePage(),
  ));
}

class StartWidget extends StatefulWidget {
  const StartWidget({Key? key}) : super(key: key);

  @override
  State<StartWidget> createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  String url = 'https://attendly-backend.vercel.app/api/profile';

  Future<ProfileLoggedIn> _profilefetch() async {
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    ProfileLoggedIn profile = json.decode(response.body);
    return profile;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _profilefetch(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isAuth == true) {
              print(snapshot.data!);
              return const HomePage();
            }
          }
          return const LoginScreen();
        });
  }
}
