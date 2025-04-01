import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

//Construir a Janela
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Perfil do Usuário"),
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => print("Configurações Pressionado"),
        ),
        IconButton(
          onPressed: () => print("Sair Pressionado"), 
          icon: Icon(Icons.exit_to_app))
      ],
      backgroundColor: Colors.deepPurpleAccent
      
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            // Imagem de perfil
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                "https://jpimg.com.br/uploads/2024/12/7-racas-de-gato-com-filhotes-muito-fofos.jpg",
              ),
            ),
            SizedBox(height: 20), // Espaço entre a imagem e o nome
            // Nome do usuário
            Text(
              "Iasmin Arruda",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple
              ),
            ),
            SizedBox(height: 10), // Espaço entre o nome e a descrição
            // Descrição do usuário
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Ocupado!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20), // Espaço entre a descrição e a lista de opções
            // Lista de opções
            Expanded(
              child: ListView(
                children: [
                  // Opção 1 - Informações Pessoais
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.deepPurple),
                    title: Text("Informações Pessoais"),
                    onTap: () {
                      print("Abrir Informações Pessoais");
                    },
                  ),
                  Divider(),
                  // Opção 2 - Configurações
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.deepPurple),
                    title: Text("Configurações"),
                    onTap: () {
                      print("Abrir Configurações");
                    },
                  ),
                  Divider(),
                  // Opção 3 - Histórico de Atividades
                  ListTile(
                    leading: Icon(Icons.history, color: Colors.deepPurple),
                    title: Text("Histórico de Atividades"),
                    onTap: () {
                      print("Abrir Histórico de Atividades");
                    },
                  ),
                  Divider(),
                  // Opção 4 - Sair
                  ListTile(
                    leading: Icon(Icons.exit_to_app, color: Colors.deepPurple),
                    title: Text("Sair"),
                    onTap: () {
                      print("Sair do perfil");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
