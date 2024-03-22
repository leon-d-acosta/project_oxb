import 'package:flutter/material.dart';

class Users {
  final int? user_id;
  final String nome;
  final String email;
  final String password;
  final String morada;
  final String localidade;
  final String codigo_postal;

  Users({
    this.user_id,
    required this.nome,
    required this.email,
    required this.password,
    required this.morada,
    required this.localidade,
    required this.codigo_postal
  });
}