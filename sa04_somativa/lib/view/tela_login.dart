import 'package:flutter/material.dart';

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('App', style: TextStyle(fontSize: 32, color: Colors.white)),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                filled: true,
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
