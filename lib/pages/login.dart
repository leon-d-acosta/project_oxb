// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1/pages/homepage.dart';
import 'package:project1/pages/properties/register_button.dart';
import 'package:project1/pages/views/forgot.dart';

class Login extends StatelessWidget {
  Login({Key? key});

  final emailController = TextEditingController();
  final passController = TextEditingController();

  Future<void> forgotButton(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPage()));
  }

  Future<void> loginFunction(BuildContext context) async {
    // Verificar si los campos están vacíos
    if (emailController.text.isEmpty || passController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Datos insuficientes'),
      ));
      return; // Salir de la función si faltan datos
    }

    var url = Uri.parse('http://192.168.1.110/xampp/project_oxb-2/project1/lib/pages/db/login.php');
    final response = await http.post(
      url,
      body: {
        'email': emailController.text,
        'pass': passController.text,
      },
    );
    if (response.statusCode == 200) {
      var decodedData;
      try {
        decodedData = json.decode(response.body);
      } catch (e) {
        print('Error al decodificar la respuesta del servidor: $e');
      }
      if (decodedData != null && decodedData['success'] != null) {
        if (decodedData['success']) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(decodedData['message'] ?? 'Error desconocido'),
          ));
        }
      } else {
        print("aqui rompe");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error de conexión: ${response.statusCode} - ${response.reasonPhrase}'),
      ));
      print('Error de conexión: ${response.statusCode} - ${response.reasonPhrase}');
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ICONO
              Icon(Icons.account_circle_rounded, size: 150, color: colors.secondaryContainer),
              // LOGIN TEXT
              SizedBox(height: 15),
              Text(
                "L O G I N",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // MAIL
              SizedBox(height: 50),
              Form(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colors.secondaryContainer,
                  ),
                  child: TextField(
                    controller: emailController,
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
              // PASS
              SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                margin: const EdgeInsets.only(left: 40, right: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colors.secondaryContainer,
                ),
                child: TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    border: InputBorder.none,
                    filled: true,
                    hintText: "password",
                  ),
                ),
              ),
              // FORGOT PASS
              SizedBox(height: 25),
              RegisterButton(
                onTap: ()=>forgotButton(context),
              ),
              // SIGN IN
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => loginFunction(context),
                child: Text("SIGN IN"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
