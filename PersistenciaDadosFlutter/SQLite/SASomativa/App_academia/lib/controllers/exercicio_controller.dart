import 'package:flutter/material.dart'; 
import 'package:treino/services/exercicio_service.dart';
import '../models/rotina_de_treino.dart'; 
import '../models/exercicio.dart'; 

class ExercicioController with ChangeNotifier {
  final ExercicioService _exercicioService = ExercicioService();

  List<Exercicio> _exercicio = []; 
  List<Exercicio> get exercicio => _exercicio; 

  RotinaDeTreino? _rotinaAtual; 

  void definirRotinaAtual(RotinaDeTreino rotina) { 
    _rotinaAtual = rotina;
    carregarExercicio(); 
  }

  Future<void> carregarExercicio() async { 
    if (_rotinaAtual == null) return; 

    _exercicio = await _exercicioService.getExercicioByRoutineId(_rotinaAtual!.id!); 
    notifyListeners();
  }

  Future<void> adicionarExercicio(Exercicio exercicio) async { 
    if (_rotinaAtual == null) return; 

    exercicio.routineId = _rotinaAtual!.id!; // Referência a _rotinaAtual
    await _exercicioService.insertExercicio(exercicio); 
    await carregarExercicio(); 
  }

  Future<void> atualizarExercicio(Exercicio exercicio) async { 
    await _exercicioService.updateExercicio(exercicio); 
    await carregarExercicio(); // Renomeado para carregarExercicios
  }

  Future<void> deletarExercicio(int id) async { 
    await _exercicioService.deleteExercicio(id);
    await carregarExercicio(); 
  }

  void limpar() { // Renomeado para limpar
    _rotinaAtual = null;
    _exercicio = [];
    notifyListeners();
  }
}


