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
  
  void change(){
  }
  void ChangeNome() {
  }

  void ChangeEmail() {
  }

  void ChangeMorada() {
  }

  void ChangeLocalidade() {
  }

  void ChangeCodigoPostal() {
  }

  Future<dynamic> _getPerfil() async {
    var url = Uri.parse('http://10.0.0.52/xampp/project_oxb-2/lib/pages/db/perfil.php');
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
              return Center(
                child: Column(
                  children: [
                    SizedBox(height: 175,),
                    Icon(Icons.person, color: Colors.white, size: 125,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('$snap[nome]', style: TextStyle(color: Colors.white),),
                        ElevatedButton(onPressed: ChangeNome, child: Icon(Icons.edit)),

                        Text('$snap[email]', style: TextStyle(color: Colors.white),),
                        ElevatedButton(onPressed: ChangeEmail, child: Icon(Icons.edit)),

                        Text('$snap[morada]', style: TextStyle(color: Colors.white),),
                        ElevatedButton(onPressed: ChangeMorada, child: Icon(Icons.edit)),

                        Text('$snap[localidade]', style: TextStyle(color: Colors.white),),
                        ElevatedButton(onPressed: ChangeLocalidade, child: Icon(Icons.edit)),

                        Text('$snap[codigo_postal]', style: TextStyle(color: Colors.white),),
                        ElevatedButton(onPressed: ChangeCodigoPostal, child: Icon(Icons.edit)),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

}
