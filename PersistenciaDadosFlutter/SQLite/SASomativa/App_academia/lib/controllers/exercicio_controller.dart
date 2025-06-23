import 'package:flutter/material.dart'; // Importação para ChangeNotifier
import 'package:treino/services/exercicio_service.dart';
import '../models/rotina_de_treino.dart'; // Nome do arquivo do modelo atualizado
import '../models/exercicio.dart'; // Nome do arquivo do modelo atualizado

class ExercicioController with ChangeNotifier {
  final ExercicioService _exercicioService = ExercicioService();

  List<Exercicio> _exercicio = []; // Renomeado para Exercicio (singular)
  List<Exercicio> get exercicio => _exercicio; // Renomeado para Exercicio

  RotinaDeTreino? _rotinaAtual; // Renomeado para RotinaDeTreino e _rotinaAtual

  void definirRotinaAtual(RotinaDeTreino rotina) { // Renomeado para definirRotinaAtual e RotinaDeTreino
    _rotinaAtual = rotina;
    carregarExercicio(); // Renomeado para carregarExercicios
  }

  Future<void> carregarExercicio() async { // Renomeado para carregarExercicios
    if (_rotinaAtual == null) return; // Referência a _rotinaAtual

    _exercicio = await _exercicioService.getExercicioByRoutineId(_rotinaAtual!.id!); // Referência a _rotinaAtual
    notifyListeners();
  }

  Future<void> adicionarExercicio(Exercicio exercicio) async { // Renomeado para adicionarExercicio e Exercicio
    if (_rotinaAtual == null) return; // Referência a _rotinaAtual

    exercicio.routineId = _rotinaAtual!.id!; // Referência a _rotinaAtual
    await _exercicioService.insertExercicio(exercicio); // Passa o objeto singular Exercicio
    await carregarExercicio(); // Renomeado para carregarExercicios
  }

  Future<void> atualizarExercicio(Exercicio exercicio) async { // Renomeado para atualizarExercicio e Exercicio
    await _exercicioService.updateExercicio(exercicio); // Passa o objeto singular Exercicio
    await carregarExercicio(); // Renomeado para carregarExercicios
  }

  Future<void> deletarExercicio(int id) async { // Renomeado para deletarExercicio
    await _exercicioService.deleteExercicio(id);
    await carregarExercicio(); // Renomeado para carregarExercicios
  }

  void limpar() { // Renomeado para limpar
    _rotinaAtual = null;
    _exercicio = [];
    notifyListeners();
  }
}


