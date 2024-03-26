// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChangeNomeAlert extends StatefulWidget {
  const ChangeNomeAlert({Key? key}) : super(key: key);

  @override
  State<ChangeNomeAlert> createState() => _ChangeNomeAlertState();
}

class _ChangeNomeAlertState extends State<ChangeNomeAlert> {

  final nomeController = TextEditingController();

  // Método para obtener los datos del perfil
  Future<dynamic> _getData() async {
    var url = Uri.parse('http://10.0.0.52/xampp/project_oxb-2/lib/pages/db/perfil.php');
    var response = await http.get(url);
    var responseBody = json.decode(response.body);
    return responseBody;
  }
  
  // Método para cambiar los datos
  Future<void> changeData() async {
    
    if (nomeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Datos insuficientes'),
      ));
      return; // Salir de la función si faltan datos
    }

    var url = Uri.parse('http://10.0.0.52/xampp/project_oxb-2/lib/pages/db/update.php');
    final response = await http.post(
      url,
      body: {
        'user_nome': nomeController.text,
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
    };
  }
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      content: Container(
        height: 250,
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: _getData(),
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
            // Verifica si los datos obtenidos son válidos y no nulos
            if (snapshot.hasData && snapshot.data != null) {
              // Convierte los datos a una lista
              List<dynamic> snap = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Muestra el nombre actual obtenido de los datos
                  Text("nome atual: " + snap[0]['user_nome'], style: TextStyle(color: Colors.black)),
                  // Campo de texto para el nuevo nombre
                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      filled: false,
                      hintText: 'Novo nome',
                    ),
                  ),
                  // Botón para guardar el cambio
                  GestureDetector(
                    onTap: changeData,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Guardar cambio', style: TextStyle(color: Colors.white)),
                          Icon(Icons.edit, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  Text("Para ver los cambios debes reiniciar la aplicacion", style: TextStyle(color:  Colors.red),),
                ],
              );
            } else {
              return Center(
                child: Text("No data available"),
              );
            }
          },
        ),
      ),
    );
  }
}