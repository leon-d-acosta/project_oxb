// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project1/pages/properties/register_button.dart';
import 'package:project1/pages/properties/sign_in_button.dart';
import 'package:http/http.dart' as http;


class login extends StatelessWidget {
  login({super.key});

  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  void forgotBTN(){}

  final formKey = GlobalKey<FormState>();

  Future<void> loginFunction(BuildContext context)async{
    var url = Uri.parse('http://localhost/xampp/project_oxb-2/project1/lib/pages/db/login.php');
    final response = await http.post(
      url, 
      body: {
        'email': mailController.text,
        'password': passwordController.text,
      },
    );

    final responseData = json.decode(response.body);
    if (responseData['success']) {
      Navigator.pushReplacementNamed(context, '/homepage');
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseData['message']))
      );
    }
  }

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
                Icon(Icons.account_circle_rounded, size: 150, color: colors.secondaryContainer,),
                //LOGIN TEXT
                SizedBox(height: 15,),
                Text("L O G I N", style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
                //MAIL
                SizedBox(height: 50),
                Form(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors.secondaryContainer,
                    ),
                    child: TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return "mail é requerido";
                        }
                        return null;
                      },
                      controller: mailController,
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                        filled: true,
                        hintText: "mail@example.com",
                      ),
                    ),
                  ),
                ),
                //PASSWORD
                SizedBox(height: 25,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colors.secondaryContainer,
                  ),
                  child: TextFormField(
                    validator:(value) {
                        if (value!.isEmpty) {
                          return "senha é requerida";
                        }
                        return null;
                      },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      border: InputBorder.none,
                      filled: true,
                      hintText: "password",
                    ),
                  ),
                ),
                //FORGOT PASSWORD
                SizedBox(height: 25),
                registerButton(
                onTap: forgotBTN,
                ),
              // SIGN IN
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: ()=>loginFunction(context), 
                child: Text("SIGN IN"),)
                ],
            ),
          )
          ),
      );
  }
}