// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_catalog/services/auth_services.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();
    var password = TextEditingController();
    var name = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOGIN",
              style: TextStyle(
                fontSize: 30,
                color: Colors.blueAccent,
                fontFamily: GoogleFonts.tajawal().fontFamily,
              ),
            ),Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                    hintText: "Enter Your name", label: Text("Name")),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                    hintText: "Enter Email", label: Text("Email")),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: password,
                decoration: InputDecoration(
                    hintText: "Enter Password", label: Text("Password")),
              ),
            ),
            Container(
              height: 30,
              width: 100,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  if (!email.text.isEmpty || !password.text.isEmpty) {
                    context
                        .read<AuthService>()
                        .login(email.text.trim(), password.text.trim());
                  }
                },
                child: Text("Login"),
              ),
            ),
            Container(
              height: 30,
              width: 100,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  if (!email.text.isEmpty || !password.text.isEmpty) {
                    context
                        .read<AuthService>()
                        .signup(name.text.trim(),email.text.trim(), password.text.trim());
                  }
                },
                child: Text("Signup"),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}