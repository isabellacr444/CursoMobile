import 'package:flutter/material.dart';

// Importe os arquivos que formar criados na pasta view
import 'view/tela_login.dart';
import 'view/tela_02.dart';
import 'view/tela_03.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Desabilita a bandeira de debug
    initialRoute: "/", // Qual será a primeira tela a ser carregada
  routes: {    // Mapa das rotas que define qual a navegação entre as telas
  "/": (context) => TelaLogin(),
  "/tela02": (context) => Tela02(),
  // "/tela03": (context) => Tela03(), // Não esta sendo utilizada no momento
},

  ));
}
