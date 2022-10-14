// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:attendly/custom_widgets.dart';
import 'package:attendly/models/user_model.dart';
import 'package:attendly/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ndialog/ndialog.dart';

import '../color_constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Color accent = Colors.orangeAccent.shade700;

  String url = 'https://attendly-backend.vercel.app/api/register';

  Future registerUser(String fname, String sname, String email, String pass,
      String pass2) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(context,
        loadingWidget: loadwidget(),
        blur: 12,
        backgroundColor: Colors.transparent);
    progressDialog.show();
    // ignore: unused_local_variable
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
    String errormessage = 'Some error happened. Please try again.';
    if (fname.isEmpty || sname.isEmpty || email.isEmpty || pass.isEmpty) {
      errormessage = 'No Field can remain empty';
    } else if (pass != pass2) {
      errormessage = 'Password and Confirm Password \ndo not match.';
    } else if (pass.length < 8) {
      errormessage = "Password Length must be\nat least 8.";
    }

    if (response.statusCode == 200) {
      RegisterResponseMessage registerResponse =
          RegisterResponseMessage(auth: false, message: 'Error');
      registerResponse =
          RegisterResponseMessage.fromJson(jsonDecode(response.body));

      if (registerResponse.auth == true) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => LoginScreen()));
      } else {
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
            errormessage,
            style: TextStyle(color: t1, fontWeight: FontWeight.bold),
          ),
        );
        progressDialog.dismiss();
        // ignore: use_build_context_synchronously
        alertDialog.show(context);
      }
    }
    NAlertDialog alertDialog = NAlertDialog(
      title: Row(
        children: [
          Text(
            'Error',
            style: TextStyle(
                color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold),
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
        errormessage,
        style: TextStyle(color: t1, fontWeight: FontWeight.bold),
      ),
    );
    progressDialog.dismiss();
    // ignore: use_build_context_synchronously
    alertDialog.show(context);
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

