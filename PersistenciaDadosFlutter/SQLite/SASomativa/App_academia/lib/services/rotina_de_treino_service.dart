
import 'package:sqflite/sqflite.dart';
import 'package:treino/models/rotina_de_treino.dart'; 
import 'package:treino/services/auxiliar_banco_dados.dart'; 
import 'package:treino/services/exercicio_service.dart'; 

class RotinaDeTreinoService { 
  final AuxiliarBancoDados _auxiliarBd = AuxiliarBancoDados(); 
  final ExercicioService _servicoDeExercicio = ExercicioService(); 

  Future<int> inserirRotina(RotinaDeTreino rotina) async { // Renomeado e tipo de parâmetro atualizado
    final db = await _auxiliarBd.database; 
    return await db.insert(
      AuxiliarBancoDados.TABELA_ROTINAS, // Nome da tabela atualizado
      rotina.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<RotinaDeTreino>> getRotinas() async { 
    final db = await _auxiliarBd.database; 
    final List<Map<String, dynamic>> maps = await db.query(AuxiliarBancoDados.TABELA_ROTINAS); 

    List<RotinaDeTreino> rotinas = List.generate(maps.length, (i) { 
      return RotinaDeTreino.fromMap(maps[i]); 
    });

    
    for (var rotina in rotinas) { 
      if (rotina.id != null) {
        // Chamando o método do serviço de exercícios traduzido
        rotina.exercicios = await _servicoDeExercicio.getExerciciosPorIdRotina(rotina.id!); 
      }
    }
    return rotinas;
  }

  Future<int> atualizarRotina(RotinaDeTreino rotina) async {
    final db = await _auxiliarBd.database; 
    return await db.update(
      AuxiliarBancoDados.TABELA_ROTINAS, // Nome da tabela atualizado
      rotina.toMap(),
      where: '${AuxiliarBancoDados.COLUNA_ROTINA_ID} = ?', // Nome da coluna atualizado
      whereArgs: [rotina.id],
    );
  }

  Future<int> deletarRotina(int id) async { 
    final db = await _auxiliarBd.database; 

    return await db.delete(
      AuxiliarBancoDados.TABELA_ROTINAS, 
      where: '${AuxiliarBancoDados.COLUNA_ROTINA_ID} = ?', 
      whereArgs: [id],
    );
  }
}
