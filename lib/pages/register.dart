// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project1/pages/properties/register_button.dart';
import 'package:project1/pages/properties/textfield.dart';


class registerPage extends StatelessWidget {
  registerPage({super.key});

  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  void sendRegistToDB(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(87, 87, 87, 1),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                //ICONO
                SizedBox(height: 60),
                Icon(Icons.account_circle_rounded, size: 150,),
                //LOGIN TEXT
                SizedBox(height: 15,),
                Text("R E G I S T E R", style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
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
                //SIGN IN
                SizedBox(height: 20),
                registerButton(onTap: sendRegistToDB),
              ],
            ),
          )
          ),
      );
  }
}