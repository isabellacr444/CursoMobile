// lib/services/exercicio_service.dart
import 'package:sqflite/sqflite.dart';
import 'package:treino/models/exercicio.dart'; // Importação do modelo Exercicio atualizado
import 'package:treino/services/auxiliar_banco_dados.dart'; // Importação do AuxiliarBancoDados


class ExercicioService { // Renomeado de ExerciseService para ExercicioService
  final AuxiliarBancoDados _auxiliarBd = AuxiliarBancoDados(); // Renomeado _dbHelper para _auxiliarBd

  Future<int> inserirExercicio(Exercicio exercicio) async { // Renomeado e tipo de parâmetro atualizado
    final db = await _auxiliarBd.database; // Referência ao auxiliar de BD
    return await db.insert(
      AuxiliarBancoDados.TABELA_EXERCICIOS, // Nome da tabela atualizado
      exercicio.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Exercicio>> getExerciciosPorIdRotina(int idRotina) async { // Renomeado e tipo de parâmetro/retorno atualizado
    final db = await _auxiliarBd.database; // Referência ao auxiliar de BD
    final List<Map<String, dynamic>> maps = await db.query(
      AuxiliarBancoDados.TABELA_EXERCICIOS, // Nome da tabela atualizado
      where: '${AuxiliarBancoDados.COLUNA_EXERCICIO_ID_ROTINA} = ?', // Nome da coluna atualizado
      whereArgs: [idRotina],
      orderBy: AuxiliarBancoDados.COLUNA_EXERCICIO_ID, // Nome da coluna atualizado
    );
    return List.generate(maps.length, (i) {
      return Exercicio.fromMap(maps[i]);
    });
  }

  Future<int> atualizarExercicio(Exercicio exercicio) async { // Renomeado e tipo de parâmetro atualizado
    final db = await _auxiliarBd.database; // Referência ao auxiliar de BD
    return await db.update(
      AuxiliarBancoDados.TABELA_EXERCICIOS, // Nome da tabela atualizado
      exercicio.toMap(),
      where: '${AuxiliarBancoDados.COLUNA_EXERCICIO_ID} = ?', // Nome da coluna atualizado
      whereArgs: [exercicio.id],
    );
  }

  Future<int> deletarExercicio(int id) async { // Renomeado
    final db = await _auxiliarBd.database; // Referência ao auxiliar de BD
    return await db.delete(
      AuxiliarBancoDados.TABELA_EXERCICIOS, // Nome da tabela atualizado
      where: '${AuxiliarBancoDados.COLUNA_EXERCICIO_ID} = ?', // Nome da coluna atualizado
      whereArgs: [id],
    );
  }

  // Novo método crucial para deletar exercícios de uma rotina específica
  Future<int> deletarExerciciosPorIdRotina(int idRotina) async { // Renomeado e tipo de parâmetro atualizado
    final db = await _auxiliarBd.database; // Referência ao auxiliar de BD
    return await db.delete(
      AuxiliarBancoDados.TABELA_EXERCICIOS, // Nome da tabela atualizado
      where: '${AuxiliarBancoDados.COLUNA_EXERCICIO_ID_ROTINA} = ?', // Nome da coluna atualizado
      whereArgs: [idRotina],
    );
  }
}
