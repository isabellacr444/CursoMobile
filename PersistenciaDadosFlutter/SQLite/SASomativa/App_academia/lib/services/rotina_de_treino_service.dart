
import 'package:sqflite/sqflite.dart';
import 'package:treino/models/rotina_de_treino.dart'; // Importação do modelo RotinaDeTreino atualizado
import 'package:treino/services/auxiliar_banco_dados.dart'; // Importação do AuxiliarBancoDados (seu helper de DB)
import 'package:treino/services/exercicio_service.dart'; // Importação do Serviço de Exercícios

class RotinaDeTreinoService { // Renomeado de TrainingRoutineService para RotinaDeTreinoService
  final AuxiliarBancoDados _auxiliarBd = AuxiliarBancoDados(); // Renomeado _dbHelper para _auxiliarBd
  final ExercicioService _servicoDeExercicio = ExercicioService(); // Renomeado _exerciseService para _servicoDeExercicio

  Future<int> inserirRotina(RotinaDeTreino rotina) async { // Renomeado e tipo de parâmetro atualizado
    final db = await _auxiliarBd.database; // Referência ao auxiliar de BD
    return await db.insert(
      AuxiliarBancoDados.TABELA_ROTINAS, // Nome da tabela atualizado
      rotina.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<RotinaDeTreino>> getRotinas() async { // Renomeado
    final db = await _auxiliarBd.database; // Referência ao auxiliar de BD
    final List<Map<String, dynamic>> maps = await db.query(AuxiliarBancoDados.TABELA_ROTINAS); // Nome da tabela atualizado

    // Você pode optar por carregar os exercícios aqui ou na tela de detalhes
    // Para a lista principal, talvez só o nome da rotina seja suficiente por enquanto.
    List<RotinaDeTreino> rotinas = List.generate(maps.length, (i) { // Renomeado
      return RotinaDeTreino.fromMap(maps[i]); // Referência ao modelo atualizado
    });

    // Se você quiser carregar os exercícios na lista principal também (para ExpansionTile)
    for (var rotina in rotinas) { // Renomeado
      if (rotina.id != null) {
        // Chamando o método do serviço de exercícios traduzido
        rotina.exercicios = await _servicoDeExercicio.getExerciciosPorIdRotina(rotina.id!); // Referência ao método e propriedade atualizados
      }
    }
    return rotinas;
  }

  Future<int> atualizarRotina(RotinaDeTreino rotina) async { // Renomeado e tipo de parâmetro atualizado
    final db = await _auxiliarBd.database; // Referência ao auxiliar de BD
    return await db.update(
      AuxiliarBancoDados.TABELA_ROTINAS, // Nome da tabela atualizado
      rotina.toMap(),
      where: '${AuxiliarBancoDados.COLUNA_ROTINA_ID} = ?', // Nome da coluna atualizado
      whereArgs: [rotina.id],
    );
  }

  Future<int> deletarRotina(int id) async { // Renomeado
    final db = await _auxiliarBd.database; // Referência ao auxiliar de BD
    // A deleção em cascata (ON DELETE CASCADE) no DB deve cuidar dos exercícios
    return await db.delete(
      AuxiliarBancoDados.TABELA_ROTINAS, // Nome da tabela atualizado
      where: '${AuxiliarBancoDados.COLUNA_ROTINA_ID} = ?', // Nome da coluna atualizado
      whereArgs: [id],
    );
  }
}
