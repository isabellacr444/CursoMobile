// lib/services/exercicio_service.dart
import 'package:sqflite/sqflite.dart';
import 'package:treino/models/exercicio.dart'; 
import 'package:treino/services/auxiliar_banco_dados.dart'; 


class ExercicioService { // Renomeado de ExerciseService para ExercicioService
  final AuxiliarBancoDados _auxiliarBd = AuxiliarBancoDados(); // 

  Future<int> inserirExercicio(Exercicio exercicio) async { 
    final db = await _auxiliarBd.database; 
    return await db.insert(
      AuxiliarBancoDados.TABELA_EXERCICIOS, 
      exercicio.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Exercicio>> getExerciciosPorIdRotina(int idRotina) async { // Renomeado e tipo de parâmetro/retorno atualizado
    final db = await _auxiliarBd.database; 
    final List<Map<String, dynamic>> maps = await db.query(
      AuxiliarBancoDados.TABELA_EXERCICIOS, // Nome da tabela atualizado
      where: '${AuxiliarBancoDados.COLUNA_EXERCICIO_ID_ROTINA} = ?', 
      whereArgs: [idRotina],
      orderBy: AuxiliarBancoDados.COLUNA_EXERCICIO_ID, 
    );
    return List.generate(maps.length, (i) {
      return Exercicio.fromMap(maps[i]);
    });
  }

  Future<int> atualizarExercicio(Exercicio exercicio) async { 
    final db = await _auxiliarBd.database; // Referência ao auxiliar de BD
    return await db.update(
      AuxiliarBancoDados.TABELA_EXERCICIOS, // Nome da tabela atualizado
      exercicio.toMap(),
      where: '${AuxiliarBancoDados.COLUNA_EXERCICIO_ID} = ?',
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
  Future<int> deletarExerciciosPorIdRotina(int idRotina) async { 
    final db = await _auxiliarBd.database; 
    return await db.delete(
      AuxiliarBancoDados.TABELA_EXERCICIOS, // Nome da tabela atualizado
      where: '${AuxiliarBancoDados.COLUNA_EXERCICIO_ID_ROTINA} = ?', 
      whereArgs: [idRotina],
    );
  }
}
