import 'package:flutter/material.dart';

// Importe a partir da pasta view
import 'view/tela_login.dart';
import 'view/tela_02.dart';
import 'view/tela_03.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Desabilita a bandeira de debug
    initialRoute: "/",
  routes: {
  "/": (context) => TelaLogin(),
  "/tela02": (context) => Tela02(),
  // "/tela03": (context) => Tela03(), // pode remover ou comentar
},

  ));
}
