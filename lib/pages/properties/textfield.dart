// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obscureText;
  const myTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey.shade500)
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText
        ),
      ),
      );
}
}