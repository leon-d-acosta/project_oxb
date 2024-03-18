// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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

  List listTarefas = List.empty(growable: true);
  /*getAllData()async{
    var response = await http.get("url");
    if(response.statusCode == 200){
      setState(() {
        listTarefas = json.decode(response.body);
      });
      return listTarefas;
    }
  }

  @override
  void initState() {
    super.initState();
    getAllData();
  }*/

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: double.infinity,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(15),
          
          child: ListView(
            children: [

              Container(
                decoration: BoxDecoration(
                  color: colors.secondaryContainer,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1,
                    style: BorderStyle.solid,
                  )
                ),
                height: 500,
              ),

            ],
          ),
        ),
        ),
    );
  }
}