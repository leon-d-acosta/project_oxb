// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:project1/pages/properties/register_button.dart';
import 'package:project1/pages/properties/sign_in_button.dart';

class login extends StatelessWidget {
  login({super.key});

  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  void signInBtn(){}
  void forgotBTN(){}

  final formKey = GlobalKey<FormState>();
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
              signInButton(
                onTap: (){
                  if(formKey.currentState!.validate()){
                    
                  }
                }
                )
                ],
            ),
          )
          ),
      );
  }
}