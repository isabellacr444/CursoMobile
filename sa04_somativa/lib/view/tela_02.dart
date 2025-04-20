import 'package:flutter/material.dart';
import 'tela_03.dart'; // Importa a Tela03 para navegação

class Tela02 extends StatefulWidget {
  @override
  _Tela02State createState() => _Tela02State();
}

class _Tela02State extends State<Tela02> {
  final List<String> pendentes = ['Comprar mantimentos', 'Enviar relatório', 'Montar apresentação'];
  final List<String> concluidas = ['Responder emails'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Pendentes'),
                Tab(text: 'Concluídas'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: pendentes.length,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text(pendentes[index]));
                    },
                  ),
                  ListView.builder(
                    itemCount: concluidas.length,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text(concluidas[index]));
                    },
                  ),
                ],
              ),
            ),
            // Botão para ir ao Dashboard
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tela03(
                        tarefasPendentes: pendentes.length,
                        tarefasConcluidas: concluidas.length,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.dashboard),
                label: Text("Ir para Dashboard"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Tarefas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
