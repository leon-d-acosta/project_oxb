// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, unnecessary_import


//vamos viendo
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;


class minhasTarefasView extends StatefulWidget {
  const minhasTarefasView({super.key});

  @override
  State<minhasTarefasView> createState() => _minhasTarefasViewState();
}


class _minhasTarefasViewState extends State<minhasTarefasView> {

  getMethod()async{
    //final List<dynamic> lista = [{"nome": "leonA"}];
    //http://localhost/xampp/project_oxb-2/lib/pages/db/get_tarefas.php
    var url = Uri.parse('http://localhost/xampp/project_oxb-2/lib/pages/db/get_tarefas.php');
    var res = await http.get(url);
    var responseBody=json.decode(res.body);
    return responseBody;
  }


 @override
Widget build(BuildContext context) {
  final colors = Theme.of(context).colorScheme;
  return Container(
    height: double.infinity,
    child: Center(
      child: Container(
        margin: EdgeInsets.all(15),
        child: FutureBuilder(
          future: getMethod(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("error fetching data"),
              );
            }
            List snap = snapshot.data;
            return ListView.builder(
              itemCount: snap.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
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
                        SizedBox(height: 10),
                        Text(
                          "${snap[index]['nome']}",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 1, color: colors.onSurface),
                        Text(
                          "Carro: ${snap[index]['carro']}",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Motorista: ${snap[index]['motorista']}",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Data: ${snap[index]['data']}",
                          style: TextStyle(fontSize: 25),
                        ),
                        Text("Rota:", style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),),
                        Text(
                          "${snap[index]['rota']}",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Estado: ${snap[index]['estado']}",
                          style: TextStyle(fontSize: 20),
                        ),
                        Divider(thickness: 1, color: colors.onSurface),
                        Text("Observaçoes:"),
                        Text(
                          "${snap[index]['observacoes']}",
                          style: TextStyle(fontSize: 15),
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
}}