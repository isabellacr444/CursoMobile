import 'package:flutter/material.dart';
import 'package:treino/models/exercicio.dart'; // Importação do modelo Exercicio atualizado
import 'package:treino/models/rotina_de_treino.dart'; 

import 'package:treino/services/exercicio_service.dart'; 
import 'package:treino/services/rotina_de_treino_service.dart'; 

class TelaFormularioRotina extends StatefulWidget { // Renomeado para TelaFormularioRotina
  final RotinaDeTreino? rotina; 

  TelaFormularioRotina({this.rotina}); 
  @override
  _TelaFormularioRotinaState createState() => _TelaFormularioRotinaState();
}

class _TelaFormularioRotinaState extends State<TelaFormularioRotina> { 
  final _chaveFormulario = GlobalKey<FormState>(); 
  late String _nomeRotina; 
  late String _objetivo; 
  List<Exercicio> _exercicios = []; 

  final RotinaDeTreinoService _servicoRotina = RotinaDeTreinoService(); 
  final ExercicioService _servicoExercicio = ExercicioService(); 

  @override
  void initState() {
    super.initState();
    _nomeRotina = widget.rotina?.nome ?? ''; // Acessando 'nome' da rotina
    _objetivo = widget.rotina?.objetivo ?? ''; 

    if (widget.rotina != null && widget.rotina!.id != null) {
      _carregarExerciciosParaRotina(widget.rotina!.id!); // Renomeado e acessando 'id'
    }
  }

  Future<void> _carregarExerciciosParaRotina(int idRotina) async { // Renomeado
    final exercicios = await _servicoExercicio.getExerciciosPorIdRotina(idRotina); // Chamando método traduzido do serviço
    setState(() {
      _exercicios = exercicios;
    });
  }

  Future<void> _adicionarOuEditarExercicio({Exercicio? exercicio, int? indice}) async { // Renomeado e parâmetros traduzidos
   
    final novoExercicio = await showDialog<Exercicio>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(exercicio == null ? 'Novo Exercício' : 'Editar Exercício'),
        content: SingleChildScrollView(
          child: ExercicioFormularioDialog(exercicio: exercicio), // Classe auxiliar para o formulário no diálogo
        ),
      ),
    );

    if (novoExercicio != null) {
      setState(() {
        if (indice != null) {
          _exercicios[indice] = novoExercicio; // Atualiza exercício existente
        } else {
          _exercicios.add(novoExercicio); 
        }
      });
    }
  }

  void _removerExercicio(int indice) { // Renomeado e parâmetro traduzido
    setState(() {
      _exercicios.removeAt(indice);
    });
  }

  Future<void> _salvarRotina() async { // Renomeado
    if (_chaveFormulario.currentState!.validate()) {
      _chaveFormulario.currentState!.save();

      final novaRotina = RotinaDeTreino( // Renomeado para novaRotina
        id: widget.rotina?.id,
        nome: _nomeRotina, // Usando _nomeRotina
        objetivo: _objetivo, // Usando _objetivo
      );

      int idRotinaSalva; // Renomeado
      if (widget.rotina == null) {
        idRotinaSalva = await _servicoRotina.inserirRotina(novaRotina); // Chamando método traduzido do serviço
      } else {
        await _servicoRotina.atualizarRotina(novaRotina); // Chamando método traduzido do serviço
        idRotinaSalva = novaRotina.id!;
     
        await _servicoExercicio.deletarExerciciosPorIdRotina(idRotinaSalva); 

      }

      for (var exercicio in _exercicios) { 
        exercicio.idRotina = idRotinaSalva; 
        await _servicoExercicio.inserirExercicio(exercicio); 
      }

      Navigator.pop(context, true); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.rotina == null ? 'Nova Rotina' : 'Editar Rotina'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _chaveFormulario,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: _nomeRotina,
                decoration: InputDecoration(labelText: 'Nome da Rotina'),
                validator: (value) => value == null || value.isEmpty ? 'Insira o nome da rotina' : null,
                onSaved: (value) => _nomeRotina = value!.trim(),
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _objetivo,
                decoration: InputDecoration(labelText: 'Objetivo (Ex: Força, Hipertrofia)'),
                onSaved: (value) => _objetivo = value!.trim(),
              ),
              SizedBox(height: 20),
              Text(
                'Exercícios:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ElevatedButton.icon(
                onPressed: () => _adicionarOuEditarExercicio(), // Chamando método traduzido
                icon: Icon(Icons.add),
                label: Text('Adicionar Exercício'),
              ),
              SizedBox(height: 10),
              Expanded(
                child: _exercicios.isEmpty
                    ? Center(child: Text('Nenhum exercício adicionado ainda.'))
                    : ListView.builder(
                        itemCount: _exercicios.length,
                        itemBuilder: (context, index) {
                          final exercicio = _exercicios[index]; // Renomeado
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              title: Text(exercicio.nome), // Acessando 'nome' do exercício
                              subtitle: Text('${exercicio.series} Séries, ${exercicio.repeticoes} Reps, ${exercicio.carga} Carga'), // Acessando propriedades do exercício
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () => _adicionarOuEditarExercicio(exercicio: exercicio, indice: index), // Chamando método traduzido
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () => _removerExercicio(index), // Chamando método traduzido
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _salvarRotina, // Chamando método traduzido
                child: Text('Salvar Rotina'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Classe auxiliar para o diálogo de formulário de exercício
class ExercicioFormularioDialog extends StatefulWidget {
  final Exercicio? exercicio;

  ExercicioFormularioDialog({this.exercicio});

  @override
  _ExercicioFormularioDialogState createState() => _ExercicioFormularioDialogState();
}

class _ExercicioFormularioDialogState extends State<ExercicioFormularioDialog> {
  final _formKeyDialog = GlobalKey<FormState>();
  late String _nome;
  late int _series;
  late String _repeticoes;
  late String _carga;
  late String _tipo;

  @override
  void initState() {
    super.initState();
    _nome = widget.exercicio?.nome ?? '';
    _series = widget.exercicio?.series ?? 1;
    _repeticoes = widget.exercicio?.repeticoes ?? '';
    _carga = widget.exercicio?.carga ?? '';
    _tipo = widget.exercicio?.tipo ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeyDialog,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: _nome,
            decoration: InputDecoration(labelText: 'Nome do Exercício'),
            validator: (value) => value == null || value.isEmpty ? 'Insira o nome' : null,
            onSaved: (value) => _nome = value!.trim(),
          ),
          TextFormField(
            initialValue: _series.toString(),
            decoration: InputDecoration(labelText: 'Séries'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Insira o número de séries';
              if (int.tryParse(value) == null) return 'Digite um número válido';
              return null;
            },
            onSaved: (value) => _series = int.parse(value!),
          ),
          TextFormField(
            initialValue: _repeticoes,
            decoration: InputDecoration(labelText: 'Repetições'),
            validator: (value) => value == null || value.isEmpty ? 'Insira as repetições' : null,
            onSaved: (value) => _repeticoes = value!.trim(),
          ),
          TextFormField(
            initialValue: _carga,
            decoration: InputDecoration(labelText: 'Carga'),
            validator: (value) => value == null || value.isEmpty ? 'Insira a carga' : null,
            onSaved: (value) => _carga = value!.trim(),
          ),
          TextFormField(
            initialValue: _tipo,
            decoration: InputDecoration(labelText: 'Tipo (Força, Cardio, Alongamento, etc.)'),
            validator: (value) => value == null || value.isEmpty ? 'Insira o tipo' : null,
            onSaved: (value) => _tipo = value!.trim(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKeyDialog.currentState!.validate()) {
                _formKeyDialog.currentState!.save();
                final novoExercicio = Exercicio(
                  id: widget.exercicio?.id,
                  idRotina: 0, // Placeholder, será sobrescrito no _saveRoutine
                  nome: _nome,
                  series: _series,
                  repeticoes: _repeticoes,
                  carga: _carga,
                  tipo: _tipo,
                );
                Navigator.pop(context, novoExercicio);
              }
            },
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}
