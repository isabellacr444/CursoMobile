import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_firebase/firebase_options.dart';
import 'package:todo_list_firebase/views/auth_view.dart'; //importa a tela de autenticação

void main() async {
  //garante a conectividade com o firebase
WidgetsFlutterBinding.ensureInitialized();
  //conectar a firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MaterialApp(
    title: "Lista de Tarefas com FireBase",
    home: AuthView(),//widget inicial que sera carregado
    //depende do dispositivo que esta rodando
  ));
}
