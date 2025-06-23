import 'package:flutter/material.dart';
import 'package:treino/models/exercicio.dart'; // Importação do modelo Exercicio atualizado
import 'package:treino/services/exercicio_service.dart'; // Importação do Serviço de Exercícios atualizado

class TelaFormularioExercicio extends StatefulWidget { // Renomeado para TelaFormularioExercicio
  final int idRotina; // Renomeado para idRotina
  final Exercicio? exercicio; // Renomeado para exercicio (opcional para edição)

  TelaFormularioExercicio({required this.idRotina, this.exercicio}); // Renomeado idRotina e exercicio

  @override
  _TelaFormularioExercicioState createState() => _TelaFormularioExercicioState(); // Renomeado
}

class _TelaFormularioExercicioState extends State<TelaFormularioExercicio> { // Renomeado
  final _chaveFormulario = GlobalKey<FormState>(); // Renomeado para _chaveFormulario
  final _servicoExercicio = ExercicioService(); // Renomeado para _servicoExercicio

  late String _nome; // Renomeado para _nome
  late int _series; // Renomeado para _series
  late String _repeticoes; // Renomeado para _repeticoes
  late String _carga; // Renomeado para _carga
  late String _tipo; // Renomeado para _tipo

  @override
  void initState() {
    super.initState();

    _nome = widget.exercicio?.nome ?? ''; // Acessando a propriedade 'nome' do exercício
    _series = widget.exercicio?.series ?? 1; // Acessando a propriedade 'series' do exercício
    _repeticoes = widget.exercicio?.repeticoes ?? ''; // Acessando a propriedade 'repeticoes' do exercício
    _carga = widget.exercicio?.carga ?? ''; // Acessando a propriedade 'carga' do exercício
    _tipo = widget.exercicio?.tipo ?? ''; // Acessando a propriedade 'tipo' do exercício
  }

  Future<void> _salvarExercicio() async { // Renomeado para _salvarExercicio
    if (_chaveFormulario.currentState!.validate()) { // Referência à _chaveFormulario
      _chaveFormulario.currentState!.save(); // Referência à _chaveFormulario

      final exercicio = Exercicio( // Instanciando o modelo Exercicio
        id: widget.exercicio?.id,
        idRotina: widget.idRotina, // Referência à idRotina
        nome: _nome,
        series: _series,
        repeticoes: _repeticoes,
        carga: _carga,
        tipo: _tipo,
      );

      if (widget.exercicio == null) {
        await _servicoExercicio.inserirExercicio(exercicio); // Chamando o método 'inserirExercicio' do serviço
      } else {
        await _servicoExercicio.atualizarExercicio(exercicio); // Chamando o método 'atualizarExercicio' do serviço
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercicio == null ? 'Novo Exercício' : 'Editar Exercício'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _chaveFormulario, // Referência à _chaveFormulario
          child: ListView(
            children: [
              TextFormField(
                initialValue: _nome,
                decoration: InputDecoration(labelText: 'Nome do Exercício'),
                validator: (value) => value == null || value.isEmpty ? 'Insira o nome' : null,
                onSaved: (value) => _nome = value!.trim(),
              ),
              SizedBox(height: 16),
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
              SizedBox(height: 16),
              TextFormField(
                initialValue: _repeticoes,
                decoration: InputDecoration(labelText: 'Repetições'),
                validator: (value) => value == null || value.isEmpty ? 'Insira as repetições' : null,
                onSaved: (value) => _repeticoes = value!.trim(),
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _carga,
                decoration: InputDecoration(labelText: 'Carga'),
                validator: (value) => value == null || value.isEmpty ? 'Insira a carga' : null,
                onSaved: (value) => _carga = value!.trim(),
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _tipo,
                decoration: InputDecoration(labelText: 'Tipo (Força, Cardio, Alongamento, etc.)'),
                validator: (value) => value == null || value.isEmpty ? 'Insira o tipo' : null,
                onSaved: (value) => _tipo = value!.trim(),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _salvarExercicio, // Referência ao método _salvarExercicio
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
