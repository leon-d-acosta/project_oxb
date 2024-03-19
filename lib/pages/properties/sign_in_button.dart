// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class signInButton extends StatelessWidget {
  final Function()? onTap;
  const signInButton({super.key, required this.onTap});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.symmetric(horizontal: 50.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Text(
                        "SIGN IN",
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