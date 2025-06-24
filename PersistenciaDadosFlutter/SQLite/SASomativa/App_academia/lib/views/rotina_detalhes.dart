// lib/views/tela_detalhes_rotina.dart
import 'package:flutter/material.dart';
import 'package:treino/models/rotina_de_treino.dart'; 
import 'package:treino/models/exercicio.dart'; 
import 'package:treino/services/exercicio_service.dart'; 
import 'package:treino/views/tela_exercicio.dart';

class TelaDetalhesRotina extends StatefulWidget { 
  final RotinaDeTreino rotina; 

  TelaDetalhesRotina({required this.rotina}); // Renomeado 'routine' para 'rotina'

  @override
  _TelaDetalhesRotinaState createState() => _TelaDetalhesRotinaState(); // Renomeado
}

class _TelaDetalhesRotinaState extends State<TelaDetalhesRotina> { 
  final ExercicioService _servicoExercicio = ExercicioService(); 
  late Future<List<Exercicio>> _exerciciosFuturos; 

  @override
  void initState() {
    super.initState();
    _carregarExercicios(); // Renomeado _loadExercises para _carregarExercicios
  }

  void _carregarExercicios() { 
    if (widget.rotina.id != null) { 
      setState(() {
        _exerciciosFuturos = _servicoExercicio.getExerciciosPorIdRotina(widget.rotina.id!); // Acessando 'rotina.id' e método do serviço traduzido
      });
    } else {
      // Se a rotina não tem ID, não há exercícios salvos para ela ainda.
      setState(() {
        _exerciciosFuturos = Future.value([]);
      });
    }
  }

  Future<void> _navegarParaAdicionarExercicio() async { // Renomeado _navigateToAddExercise
    if (widget.rotina.id == null) { // Acessando 'rotina.id'
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, salve a rotina primeiro para adicionar exercícios.')),
      );
      return;
    }
    final resultado = await Navigator.push( // Renomeado 'result' para 'resultado'
      context,
      MaterialPageRoute(
        builder: (context) => TelaFormularioExercicio(idRotina: widget.rotina.id!), // Passando 'idRotina' para a tela de formulário traduzida
      ),
    );

    if (resultado == true) { // Ou se TelaFormularioExercicio retorna o exercício, capture-o
      _carregarExercicios(); 
    }
  }

  Future<void> _navegarParaEditarExercicio(Exercicio exercicio) async { // Renomeado _navigateToEditExercise e tipo de parâmetro
    final resultado = await Navigator.push( // Renomeado 'result' para 'resultado'
      context,
      MaterialPageRoute(
        builder: (context) => TelaFormularioExercicio( // Referên
          idRotina: widget.rotina.id!, // Passa o ID da rotina para o formulário
          exercicio: exercicio, 
        ),
      ),
    );

    if (resultado == true) { // Se o formulário retorna true ao salvar/editar
      _carregarExercicios(); 
    }
  }

  Future<void> _deletarExercicio(int idExercicio) async { // Renomeado _deleteExercise e parâmetro
    final confirmar = await showDialog<bool>( // Renomeado 'confirm' para 'confirmar'
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar Exclusão'),
        content: Text('Tem certeza que deseja excluir este exercício?'),
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
      await _servicoExercicio.deletarExercicio(idExercicio); // Chamando o método 'deletarExercicio' do serviço traduzido
      _carregarExercicios(); // Recarrega a lista
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exercício excluído com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.rotina.nome), // Acessando 'rotina.nome'
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Objetivo: ${widget.rotina.objetivo}', // Acessando 'rotina.objetivo'
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20),
            Text(
              'Exercícios da Rotina:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Exercicio>>( // Tipo do FutureBuilder atualizado
                future: _exerciciosFuturos, // Referência à Future traduzida
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro ao carregar exercícios: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Nenhum exercício adicionado a esta rotina.'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final exercicio = snapshot.data![index]; // Renomeado 'exercise' para 'exercicio'
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(exercicio.nome), // Acessando 'exercicio.nome'
                            subtitle: Text('${exercicio.series} Séries, ${exercicio.repeticoes} Reps, ${exercicio.carga} Carga'), // Acessando propriedades do exercício
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () => _navegarParaEditarExercicio(exercicio), // Chamando método traduzido
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _deletarExercicio(exercicio.id!), // Chamando método traduzido
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _navegarParaAdicionarExercicio, // Chamando método traduzido
              icon: Icon(Icons.add),
              label: Text('Adicionar Novo Exercício'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50), // Faz o botão ocupar a largura total
              ),
            ),
          ],
        ),
      ),
    );
  }
}
