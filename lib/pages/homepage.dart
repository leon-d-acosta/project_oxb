// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:project1/pages/views/anexar_imagem.dart';
import 'package:project1/pages/views/minhas_tarefas.dart';
import 'package:project1/pages/views/perfil.dart';
import 'package:project1/pages/views/qr_code.dart';
import 'package:project1/pages/views/rota.dart';
import 'package:project1/pages/views/dados_rota.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final views = const [
      MinhasTarefasView(),
      RotaView(),
      QrCodeView(),
      AnexarImagemView(),
      DadosRotaView(),
      PerfilView(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: views,
      ),
      backgroundColor: colors.onSurface,
      // MENU
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Tarefas",
            backgroundColor: colors.inverseSurface,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room),
            label: "Rota",
            backgroundColor: colors.inverseSurface,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: "Ler QR-Code",
            backgroundColor: colors.inverseSurface,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: "Anexar Imagem",
            backgroundColor: colors.inverseSurface,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: "Dados rota",
            backgroundColor: colors.inverseSurface,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Perfil",
            backgroundColor: colors.inverseSurface,
          )
        ],
      ),
    );
  }
}
