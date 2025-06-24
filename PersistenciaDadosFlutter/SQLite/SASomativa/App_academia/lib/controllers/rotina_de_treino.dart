import 'package:flutter/material.dart';
import 'package:treino/models/rotina_de_treino.dart'; 
import 'package:treino/services/rotina_de_treino_service.dart'; 


class RotinaDeTreinoController with ChangeNotifier {

  final RotinaDeTreinoService _servicoDeRotina = RotinaDeTreinoService();

  // Lista de rotinas disponíveis
  List<RotinaDeTreino> _rotinas = [];
  List<RotinaDeTreino> get rotinas => _rotinas;

  // Rotina atualmente selecionada
  RotinaDeTreino? _rotinaSelecionada;
  RotinaDeTreino? get rotinaSelecionada => _rotinaSelecionada;

  // Construtor: carrega as rotinas ao iniciar
  RotinaDeTreinoController() {
    carregarRotinas();
  }

  // =============================
  // Métodos de controle de estado

  /// Carrega todas as rotinas do banco de dados
  Future<void> carregarRotinas() async {
    _rotinas = await _servicoDeRotina.getRotinas();
    notifyListeners(); // Notifica a UI
  }

  /// Define uma rotina como selecionada
  void selecionarRotina(RotinaDeTreino rotina) {
    _rotinaSelecionada = rotina;
    notifyListeners();
  }

  /// Limpa a rotina selecionada
  void limparRotinaSelecionada() {
    _rotinaSelecionada = null;
    notifyListeners();
  }

  /// Adiciona uma nova rotina e recarrega a lista
  Future<void> adicionarRotina(RotinaDeTreino rotina) async {
    await _servicoDeRotina.inserirRotina(rotina); 
    await carregarRotinas();
  }

  /// Atualiza uma rotina existente e recarrega a lista
  Future<void> atualizarRotina(RotinaDeTreino rotina) async {
    await _servicoDeRotina.atualizarRotina(rotina); 
    await carregarRotinas();
  }

  /// Exclui uma rotina e recarrega a lista
  Future<void> deletarRotina(int id) async {
    await _servicoDeRotina.deletarRotina(id); 

    // Limpa a seleção se a rotina excluída for a selecionada
    if (_rotinaSelecionada?.id == id) {
      _rotinaSelecionada = null;
    }

    await carregarRotinas();
  }
}
