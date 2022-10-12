// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:attendly/custom_widgets.dart';
import 'package:attendly/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Color accent = Colors.orangeAccent.shade700;

  String url = 'https://attendly-backend.vercel.app/api/register';

  Future registerUser(String fname, String sname, String email,
      String pass, String pass2) async {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'firstname': fname,
        'lastname': sname,
        'email': email,
        'password': pass,
        'password2': pass2,
      }),
    );

  }

  TextEditingController firstnameController = TextEditingController();
  TextEditingController secondnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: (context) => LoginScreen()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create an Account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Sign Up, It's free",
                style: TextStyle(fontSize: 15, color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
              inputFile(label: "First Name", controller: firstnameController),
              inputFile(label: "Second Name", controller: secondnameController),
              inputFile(label: "Email", controller: emailController),
              inputFile(
                  label: "Password",
                  obscureText: true,
                  controller: passwordController),
              inputFile(
                  label: "Confirm Password",
                  obscureText: true,
                  controller: password2Controller),

              //checkbox

              SizedBox(height: 12),

              Row(
                children: [
                  Checkbox(
                    value: value,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  Text(' I agree to the Terms & Conditions'),
                ],
              ),
              SizedBox(height: 20), //Ch
              ElevatedButton(
                onPressed: () {
                  registerUser(
                    firstnameController.text,
                    secondnameController.text,
                    emailController.text,
                    passwordController.text,
                    password2Controller.text,
                  );

                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) => LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: accent, minimumSize: Size.fromHeight(50)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Already have an account?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      " Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: accent),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// we will be creating a widget for text field

