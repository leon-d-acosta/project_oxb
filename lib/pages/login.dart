// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:project1/pages/properties/register_button.dart';
import 'package:project1/pages/properties/sign_in_button.dart';
import 'package:project1/pages/properties/textfield.dart';


class login extends StatelessWidget {
  login({super.key});

  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  void signInBtn(){}
  void forgotBTN(){}

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
        backgroundColor: colors.onSurface,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                //ICONO
                SizedBox(height: 60),
                Icon(Icons.account_circle_rounded, size: 150, color: Colors.white,),
                //LOGIN TEXT
                SizedBox(height: 15,),
                Text("L O G I N", style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
                //MAIL
                SizedBox(height: 50),
                myTextField(
                  controller: mailController,
                  hintText: "mail@example.com",
                  obscureText: false,
                ),
                //PASSWORD
                SizedBox(height: 10,),
                myTextField(
                  controller: passwordController,
                  hintText: "password",
                  obscureText: true,
                ),
                //FORGOT PASSWORD
                SizedBox(height: 10,),
                registerButton(onTap: forgotBTN),
                //SIGN IN
                SizedBox(height: 20),
                signInButton(onTap: signInBtn),
                ],
            ),
          )
          ),
      );
  }
}