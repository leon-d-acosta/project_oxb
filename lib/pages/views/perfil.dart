// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PerfilView extends StatefulWidget {
  const PerfilView({Key? key}) : super(key: key);

  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  Future<dynamic> _getPerfil() async {
    var url = Uri.parse('http://10.0.0.52/xampp/project_oxb-2/lib/pages/db/login.php');
    var response = await http.get(url);
    var responseBody = json.decode(response.body);
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: double.infinity,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: FutureBuilder(
            future: _getPerfil(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error fetching data"),
                );
              }
              List snap = snapshot.data;
              return ListView.builder(
                itemCount: snap.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: colors.secondaryContainer,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    height: 400,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            "${snap[index]['email']}",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Divider(thickness: 1, color: colors.onSurface),
                          Text(
                            "Carro: ${snap[index]['nome']}",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Motorista: ${snap[index]['morada']}",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Data: ${snap[index]['localidade']}",
                            style: TextStyle(fontSize: 25),
                          ),
                          const Text("Rota:", style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),),
                          Text(
                            "${snap[index]['codigo_postal']}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
