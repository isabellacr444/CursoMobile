import 'package:flutter/material.dart';

class Tela03 extends StatelessWidget {//dados serão fixos

  final int tarefasPendentes; //quantidade de tarefas pendentes
  final int tarefasConcluidas; //quantidade de tarefas concluidas

  Tela03({
    required this.tarefasPendentes,
    required this.tarefasConcluidas,
  }); //construtor da tela

  @override
  Widget build(BuildContext context) { //interface da tela

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'), //esqueleto
      ),

      body: GridView.count(//corpo da tela e organiza os cards em tabela
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
//outros 