import 'package:flutter/material.dart';

class Users {
  final int? user_id;
  final String email;
  final String password;

  Users({
    this.user_id,
    required this.email,
    required this.password,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    user_id: json["user_id"],
    email: json["email"],
    password:  json["password"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": user_id,
    "email": email,
    "password": password,
  };
}