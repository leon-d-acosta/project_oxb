// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';

class registerButton extends StatelessWidget {
  final Function()? onTap;
  const registerButton({super.key, required this.onTap});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.symmetric(horizontal: 50.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.white,
                          Colors.black26,
                          Colors.black45,
                          Colors.black54,
                          Colors.black87
                        ]
                        ),
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Text(
                        "REGISTER",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                    ),
                  ),
                );
  }
}