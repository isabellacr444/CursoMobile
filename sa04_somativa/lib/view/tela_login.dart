import 'package:flutter/material.dart';

class TelaLogin extends StatelessWidget { // Utilizado quando a tela não é dinâmica
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple, // Definimos a cor de fundo
      body: Padding(
        padding: const EdgeInsets.all(32.0), // Definimos um padding para o espaço interno
        child: Column( // Organizar os elementos em coluna
          mainAxisAlignment: MainAxisAlignment.center, // centraliza os elementos
          children: [ 
            Text('App', style: TextStyle(fontSize: 32, color: Colors.white)),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true, // Para esconder os caracteries da senha
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                filled: true, // Para esconder os caracteries da senha
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/tela02");
              },
              child: Text('LOGIN'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
