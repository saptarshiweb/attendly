// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:attendly/color_constants.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:attendly/custom_widgets.dart';
import 'package:attendly/models/user_model.dart';
import 'package:attendly/screens/home_page_main.dart';
import 'package:attendly/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ndialog/ndialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String errormessage = 'Error Occured. Pls try again.';

  Color accent = Colors.orangeAccent.shade700;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String url = 'https://attendly-backend.vercel.app/api/login';

  // ignore: non_constant_identifier_names
  Future LoginUser(String email, String pass) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(context,
        loadingWidget: loadwidget(),
        blur: 12,
        backgroundColor: Colors.transparent);
    progressDialog.show();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Name', 'Sample-Error');

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': pass,
      }),
    );

    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously, unrelated_type_equality_checks
      LoginResponseMessage loginmessage =
          LoginResponseMessage(isAuth: false, message: '', email: '', name: '');
      loginmessage = LoginResponseMessage.fromJson(jsonDecode(response.body));

      if (loginmessage.isAuth) {
        await prefs.setString('Name', loginmessage.name);
        await prefs.setBool('signIn', true);

        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // ignore: avoid_print
        print(loginmessage.message);

        NAlertDialog alertDialog = NAlertDialog(
          title: Row(
            children: [
              Text(
                'Error',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red,
                    size: 22,
                  ))
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade400),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Dismiss',
                    style: TextStyle(
                        fontSize: 15, color: t1, fontWeight: FontWeight.bold),
                  )),
            )
          ],
          content: Text(
            loginmessage.message,
            style: TextStyle(color: t1, fontWeight: FontWeight.bold),
          ),
        );

        progressDialog.dismiss();
        // ignore: use_build_context_synchronously
        alertDialog.show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Center(
                child: Icon(
              FontAwesome5.autoprefixer,
              color: accent,
              size: 70,
            )),
            SizedBox(height: 40),
            Center(
              child: Text(
                'Welcome to Attendly!',
                style: TextStyle(
                    color: t1, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            inputFile(label: "Email ID", controller: emailController),
            inputFile(
                label: "Password",
                obscureText: true,
                controller: passwordController),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                LoginUser(emailController.text, passwordController.text);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: accent, minimumSize: Size.fromHeight(50)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create an account? ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: Text('Sign Up',
                      style: TextStyle(
                          color: accent, fontWeight: FontWeight.bold)),
                )
              ],
            ),
            SizedBox(height: 12),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Text('Forgot Password?',
                    style:
                        TextStyle(color: accent, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      )),
    );
  }
}
