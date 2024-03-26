// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final senhaController = TextEditingController();

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

              Icon(Icons.account_circle_rounded, size: 150, color: colors.secondaryContainer,),

              SizedBox(height: 15,),
              Text(
                "CHANGE PASSWORD",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),

              Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(color: colors.onSurfaceVariant),
                child: Column(
                  children: [
                    Text("Nova contrasenha:", style: TextStyle(fontSize: 20, color: Colors.white),),
                    TextField(
                      style: TextStyle(
                        color: Colors.white
                      ),
                      controller: senhaController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        icon: Icon(Icons.key),
                        iconColor: Colors.white,
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: false,
                        hintText: "Nova senha",
                      ),
                    ),

                    GestureDetector(
                      onTap: changePassword,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Guardar cambios'),
                            Icon(Icons.edit, color: Colors.white,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void changePassword() {
  }
}