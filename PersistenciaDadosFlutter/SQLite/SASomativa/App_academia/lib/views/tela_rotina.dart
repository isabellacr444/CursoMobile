import 'package:flutter/material.dart';
import 'package:treino/models/rotina_de_treino.dart'; // Importação do modelo RotinaDeTreino atualizado
import 'package:treino/services/rotina_de_treino_service.dart'; // Importação do Serviço de Rotina de Treino atualizado


class TelaFormularioRotina extends StatefulWidget { // Renomeado para TelaFormularioRotina
  final RotinaDeTreino? rotina; // Renomeado de 'routine' para 'rotina' (opcional para editar futuramente)

  TelaFormularioRotina({this.rotina}); // Renomeado 'routine' para 'rotina'

  @override
  _TelaFormularioRotinaState createState() => _TelaFormularioRotinaState(); // Renomeado
}

class _TelaFormularioRotinaState extends State<TelaFormularioRotina> { // Renomeado
  final _chaveFormulario = GlobalKey<FormState>(); // Renomeado para _chaveFormulario
  final RotinaDeTreinoService _servicoRotina = RotinaDeTreinoService(); // Renomeado _routineService para _servicoRotina

  late String _nome; // Renomeado para _nome
  late String _objetivo; // Renomeado para _objetivo

  @override
  void initState() {
    super.initState();
    _nome = widget.rotina?.nome ?? ''; // Acessando 'rotina.nome'
    _objetivo = widget.rotina?.objetivo ?? ''; // Acessando 'rotina.objetivo'
  }

  Future<void> _salvarRotina() async { // Renomeado _saveRoutine para _salvarRotina
    if (_chaveFormulario.currentState!.validate()) { // Referência à _chaveFormulario
      _chaveFormulario.currentState!.save(); // Referência à _chaveFormulario

      final rotina = RotinaDeTreino( // Instanciando o modelo RotinaDeTreino
        id: widget.rotina?.id,
        nome: _nome,
        objetivo: _objetivo,
      );

      if (widget.rotina == null) {
        await _servicoRotina.inserirRotina(rotina); // Chamando o método 'inserirRotina' do serviço traduzido
      } else {
        await _servicoRotina.atualizarRotina(rotina); // Chamando o método 'atualizarRotina' do serviço traduzido
      }

      Navigator.pop(context); // Voltar para a lista depois de salvar
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
          key: _chaveFormulario, // Referência à _chaveFormulario
          child: Column(
            children: [
              TextFormField(
                initialValue: _nome,
                decoration: InputDecoration(labelText: 'Nome da Rotina'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
                onSaved: (value) => _nome = value!.trim(),
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _objetivo,
                decoration: InputDecoration(labelText: 'Objetivo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um objetivo';
                  }
                  return null;
                },
                onSaved: (value) => _objetivo = value!.trim(),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _salvarRotina, // Chamando o método _salvarRotina
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
