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
    String url = '';
  }


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
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        "Nombre"/*$nome*/,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      SizedBox(height: 10,),
                      Divider(thickness: 1, color: colors.onSurface,),
                      Text(
                        "Carro"/*carro*/,
                        style: TextStyle(
                          fontSize: 20,
                        )
                      ),
                      Text(
                        "Motorista"/*motorista*/,
                        style: TextStyle(
                          fontSize: 20,
                        )
                      ),
                      Text(
                        "Data"/*Data*/,
                        style: TextStyle(
                          fontSize: 25,
                        )
                      ),
                      Text(
                        "Rota"/*$rota*/,
                        style: TextStyle(
                          fontSize: 25,
                        )
                      ),
                      Text(
                        "Estado"/*Estado*/,
                        style: TextStyle(
                          fontSize: 20,
                        )
                      ),
                      Divider(thickness: 1, color: colors.onSurface,),
                      Text(
                        "Observações"/*Observações*/,
                        style: TextStyle(
                          fontSize: 15,
                        )
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
        ),
    );
  }
}