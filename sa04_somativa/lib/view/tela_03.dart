import 'package:flutter/material.dart';

class Tela03 extends StatelessWidget {
  final int tarefasPendentes;
  final int tarefasConcluidas;

  Tela03({required this.tarefasPendentes, required this.tarefasConcluidas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            color: Colors.blue[100],
            child: Center(child: Text('Pendentes: $tarefasPendentes')),
          ),
          Card(
            color: Colors.green[100],
            child: Center(child: Text('Concluídas: $tarefasConcluidas')),
          ),
          // Adicione mais informações de resumo, como prazo mais próximo, etc.
        ],
      ),
    );
  }
}
