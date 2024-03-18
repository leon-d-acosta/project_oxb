// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:project1/pages/views/anexar_imagem.dart';
import 'package:project1/pages/views/minhas_tarefas.dart';
import 'package:project1/pages/views/perfil.dart';
import 'package:project1/pages/views/qr_code.dart';
import 'package:project1/pages/views/rota.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final views = [
      const minhasTarefasView(),
      const  rotaView(),
      const  qrCodeView(),
      const  anexarImagemView(),
      const  perfilView()
      ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: views,
      ),
      backgroundColor: colors.onSurface,  
      //MENU
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Minhas tarefas",
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
              icon: Icon(Icons.image),
              label: "Anexar Imagem",
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