import 'package:flutter/material.dart';
import 'package:treino/models/rotina_de_treino.dart'; // Importação do modelo RotinaDeTreino atualizado
import 'package:treino/services/rotina_de_treino_service.dart'; // Importação do Serviço de Rotina de Treino atualizado
import 'package:treino/views/tela_treino.dart'; // Importação da tela de detalhes da rotina atualizada
import 'package:treino/views/tela_rotina.dart'; // Importação da tela de formulário da rotina atualizada

void main() {
  runApp(TreinoApp());
}

class TreinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Treinos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaListaRotinasDeTreino(), // Renomeado
    );
  }
}

class TelaListaRotinasDeTreino extends StatefulWidget { // Renomeado
  @override
  _TelaListaRotinasDeTreinoState createState() => _TelaListaRotinasDeTreinoState(); // Renomeado
}

class _TelaListaRotinasDeTreinoState extends State<TelaListaRotinasDeTreino> { // Renomeado
  final RotinaDeTreinoService _servico = RotinaDeTreinoService(); // Renomeado _service para _servico
  List<RotinaDeTreino> _rotinas = []; // Renomeado _routines para _rotinas

  @override
  void initState() {
    super.initState();
    _carregarRotinas(); // Renomeado _loadRoutines para _carregarRotinas
  }

  Future<void> _carregarRotinas() async { // Renomeado _loadRoutines para _carregarRotinas
    final rotinas = await _servico.getRotinas(); // Renomeado e chamando método do serviço traduzido
    setState(() {
      _rotinas = rotinas;
    });
  }

  void _irParaAdicionarRotina() async { // Renomeado _goToAddRoutine
    final criado = await Navigator.push( // Renomeado 'created' para 'criado'
      context,
      MaterialPageRoute(builder: (_) => TelaFormularioRotina()), // Referência à tela de formulário traduzida
    );

    if (criado == true) {
      _carregarRotinas(); // Recarregar rotinas
    }
  }

  void _abrirDetalhesDaRotina(RotinaDeTreino rotina) { // Renomeado _openRoutineDetail e parâmetro
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TelaDetalhesRotina(rotina: rotina)), // Referência à tela de detalhes traduzida
    );
  }

  void _irParaEditarRotina(RotinaDeTreino rotina) async { // Renomeado _goToEditRoutine e parâmetro
    final atualizado = await Navigator.push( // Renomeado 'updated' para 'atualizado'
      context,
      MaterialPageRoute(builder: (_) => TelaFormularioRotina(rotina: rotina)), // Referência à tela de formulário traduzida
    );
    if (atualizado == true) {
      _carregarRotinas(); // Recarregar rotinas
    }
  }

  Future<void> _deletarRotina(int idRotina) async { // Renomeado _deleteRoutine e parâmetro
    final confirmar = await showDialog<bool>( // Renomeado 'confirm' para 'confirmar'
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar Exclusão'),
        content: Text('Tem certeza que deseja excluir esta rotina?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Excluir'),
          ),
        ],
      ),
    );

    if (confirmar == true) {
      await _servico.deletarRotina(idRotina); // Chamando método traduzido do serviço
      _carregarRotinas(); // Recarregar rotinas
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Rotina excluída com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotinas de Treino'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _carregarRotinas, // Chamando método traduzido
            tooltip: 'Atualizar lista',
          ),
        ],
      ),
      body: _rotinas.isEmpty // Usando _rotinas
          ? Center(child: Text('Nenhuma rotina cadastrada'))
          : ListView.builder(
              itemCount: _rotinas.length, // Usando _rotinas
              itemBuilder: (_, index) {
                final rotina = _rotinas[index]; // Renomeado 'routine' para 'rotina'
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 3,
                  child: ExpansionTile(
                    title: Text(
                      rotina.nome, // Acessando 'nome' da rotina
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: rotina.exercicios.isEmpty // CORREÇÃO: Não é mais anulável
                              ? [Text('Nenhum exercício nesta rotina.')]
                              : rotina.exercicios.map((exercicio) { // Acessando 'exercicios' da rotina e renomeando
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Text(
                                      '• ${exercicio.nome}: ${exercicio.series}x${exercicio.repeticoes} (${exercicio.carga})', // Acessando propriedades do exercício
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  );
                                }).toList(),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _irParaEditarRotina(rotina), // Chamando método traduzido
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deletarRotina(rotina.id!), // Chamando método traduzido
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _irParaAdicionarRotina, // Chamando método traduzido
        child: Icon(Icons.add),
        tooltip: 'Adicionar nova rotina',
      ),
    );
  }
}
