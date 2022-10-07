// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:attendly/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Color accent = Colors.orangeAccent.shade700;

  String url = 'https://attendly-backend.vercel.app/api/register';

  String firstname = 'Saptarshi';
  String secondname = 'Mandal';
  String email = 'sapmessi12345@gmail.com';
  String password1 = '123456789';
  String password2 = '123456789';

  // Future save() async {
  //   var res = await http.post(Uri.parse(url), headers: <String, String>{
  //     'Context-Type': 'application/json;charSet=UTF-8'
  //   }, body: <String, String>{
  //     'firstname': firstnameController.text,
  //     'secondname': secondnameController.text,
  //     'email': emailController.text,
  //     'password': passwordController.text,
  //     'password2': password2Controller.text
  //   });
  //   print(res.body);
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => LoginScreen()));
  // }

  Future<UserRegister> createPost(String fname, String sname, String email,
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

    if (response.statusCode == 201 ||
        response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return UserRegister.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      // ignore: prefer_interpolation_to_compose_strings
      throw Exception('Failed to create Notes: Status Code - ' +
          response.statusCode.toString());
    }
  }

  TextEditingController firstnameController = TextEditingController();
  TextEditingController secondnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  late UserRegister _userRegister;

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
            Navigator.pop(context);
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
              ElevatedButton(
                onPressed: () {
                  createPost(
                    firstname,secondname,email,password1,password2
              );

                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => LoginScreen()));
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
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
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
Widget inputFile(
    {label, obscureText = false, required TextEditingController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(height: 5),
      TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.orangeAccent.shade700, width: 2),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400))),
      ),
      SizedBox(height: 10)
    ],
  );
}
