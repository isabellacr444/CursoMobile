import 'package:flutter/material.dart';

class TelaLogin extends StatelessWidget { // É um widget "StatelessWidget" utilizado quando a tela não precisa ser atualizada com dados dinâmicamente
  @override
  // Dentro do "build" colocamos um Scaffold para estruturar a nossa tela
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple, // Definimos a cor de fundo
      body: Padding(
        padding: const EdgeInsets.all(32.0), // Definimos um padding para o espaço interno
        child: Column( // Organizar os widget filhos em uma coluna vertical
          mainAxisAlignment: MainAxisAlignment.center, // centraliza os elementos na tela
          children: [ 
            // Exibe o texto "APP" com o estilo de font: 32 e cor branca
            Text('App', style: TextStyle(fontSize: 32, color: Colors.white)),
            SizedBox(height: 40), // Espaçamento entre o titulo e os campos de texto
            // "TextField" para a entrada de dados do email
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true, // Garante que o campo tenha colorido
                fillColor: Colors.white,// Cor de fundo 
              ),
            ),
            SizedBox(height: 16),// Espaçamento entre a entrada de dados do email
            // Exibe campo para usuario digitar a senha
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                filled: true, // Para esconder os caracteries da senha
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 32),// Espaçamento entra os campos de email e senha e o botão de login
            // Executa a ação definida em onPressed
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/tela02"); // Define que ao ser clicado o botão leva a tela02
              },
              // Estilo do botão
              child: Text('LOGIN'), // Texto exibido dentro do botão
              style: ElevatedButton.styleFrom( 
                backgroundColor: Colors.white, // Cor de fundo do botão 
                foregroundColor: Colors.blue, // Cor do texto 
              ),
            )
          ],
        ),
      ),
    );
  }
}
