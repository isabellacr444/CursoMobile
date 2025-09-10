import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistroView extends StatefulWidget {
  const RegistroView({super.key});

  @override
  State<RegistroView> createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {
  //atributos
  final _auth = FirebaseAuth.instance;
  final _emailField = TextEditingController();
  final _senhaField = TextEditingController();
  final _confirmarSenhaField = TextEditingController();
  bool _senhaOculta = true;
  bool _confirmarSenhaOculta = true;

  //método de registro
  void _registrar() async {
    if (_confirmarSenhaField.text != _senhaField.text) {
      throw Exception("Senhas Diferentes");
    }
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailField.text.trim(),
        password: _senhaField.text.trim(),
      );
      Navigator.pop(context); //volta para a tela de login
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Falha ao Criar Conta $e")),
      );
    }
  }
  //build da Tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailField,
              decoration: const InputDecoration(labelText: "E-mail"),
            ),
            TextField(
              controller: _senhaField,
              decoration: const InputDecoration(labelText: "Senha"),
              obscureText: _senhaOculta,
            ),
            TextField(
              controller: _confirmarSenhaField,
              decoration: const InputDecoration(labelText: "Confirmar Senha"),
              obscureText: _confirmarSenhaOculta,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registrar,
              child: const Text("Registrar"),
            ),
                      ],
        ),
      ),
    );
  } 
}
