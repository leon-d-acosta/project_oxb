// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:project1/pages/changes_perfil/changeNome.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({Key? key}) : super(key: key);

  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {

  void changeNome() {
    showDialog(
      context: context, 
      builder: (context) => ChangeNomeAlert(),
      );
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
    var url = Uri.parse('http://192.168.1.110/xampp/project_oxb-2/project1/lib/pages/db/perfil.php');
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, color: colors.secondaryContainer, size: 125,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: colors.onSurfaceVariant
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(                           
                            decoration: BoxDecoration(
                              border: Border(top: BorderSide(color: Colors.black))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    snap[0]['user_nome'], 
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    ),
                                ),
                                GestureDetector(
                                  onTap: changeNome,
                                  child: Container(
                                    padding: EdgeInsets.all(20),             
                                    child: Icon(
                                      Icons.edit, 
                                      color: Colors.white,
                                      ),
                                  ),
                                )
                              ]
                            ),
                          ),
                      
                          Container(                           
                            decoration: BoxDecoration(
                              border: Border(top: BorderSide(color: Colors.black))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    snap[0]['email'], 
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    ),
                                ),
                                GestureDetector(
                                  onTap: ChangeEmail,
                                  child: Container(
                                    padding: EdgeInsets.all(20),             
                                    child: Icon(
                                      Icons.edit, 
                                      color: Colors.white,
                                      ),
                                  ),
                                )
                              ]
                            ),
                          ),
                      
                          Container(                           
                            decoration: BoxDecoration(
                              border: Border(top: BorderSide(color: Colors.black))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    snap[0]['morada'], 
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    ),
                                ),
                                GestureDetector(
                                  onTap: ChangeMorada,
                                  child: Container(
                                    padding: EdgeInsets.all(20),             
                                    child: Icon(
                                      Icons.edit, 
                                      color: Colors.white,
                                      ),
                                  ),
                                )
                              ]
                            ),
                          ),
                          Container(                           
                            decoration: BoxDecoration(
                              border: Border(top: BorderSide(color: Colors.black))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    snap[0]['localidade'], 
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    ),
                                ),
                               GestureDetector(
                                  onTap: ChangeLocalidade,
                                  child: Container(
                                    padding: EdgeInsets.all(20),             
                                    child: Icon(
                                      Icons.edit, 
                                      color: Colors.white,
                                      ),
                                  ),
                                )
                              ]
                            ),
                          ),
                          Container(                           
                            decoration: BoxDecoration(
                              border: Border(top: BorderSide(color: Colors.black))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    snap[0]['codigo_postal'], 
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    ),
                                ),
                                GestureDetector(
                                  onTap: ChangeCodigoPostal,
                                  child: Container(
                                    padding: EdgeInsets.all(20),             
                                    child: Icon(
                                      Icons.edit, 
                                      color: Colors.white,
                                      ),
                                  ),
                                )
                              ]
                            ),
                          ),
                        ]
                      ),
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
