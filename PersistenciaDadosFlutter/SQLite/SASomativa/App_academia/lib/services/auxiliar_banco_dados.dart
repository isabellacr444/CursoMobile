// lib/services/auxiliar_banco_dados.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AuxiliarBancoDados { // Renomeado para AuxiliarBancoDados
  static Database? _bancoDeDados; // Renomeado para _bancoDeDados
  static const String NOME_BD = 'training_app.db'; // Renomeado para NOME_BD
  static const int VERSAO_BD = 1; // Renomeado para VERSAO_BD

  // Nomes das tabelas
  static const String TABELA_ROTINAS = 'rotinas'; // Renomeado para TABELA_ROTINAS
  static const String TABELA_EXERCICIOS = 'exercicios'; // Renomeado para TABELA_EXERCICIOS

  // Colunas da tabela de Rotinas
  static const String COLUNA_ROTINA_ID = 'id'; // Renomeado
  static const String COLUNA_ROTINA_NOME = 'nome'; // Renomeado
  static const String COLUNA_ROTINA_OBJETIVO = 'objetivo'; // Renomeado

  // Colunas da tabela de Exercícios
  static const String COLUNA_EXERCICIO_ID = 'id'; // Renomeado
  static const String COLUNA_EXERCICIO_ID_ROTINA = 'idRotina'; // Renomeado para COLUNA_EXERCICIO_ID_ROTINA (Chave estrangeira)
  static const String COLUNA_EXERCICIO_NOME = 'nome'; // Renomeado
  static const String COLUNA_EXERCICIO_SERIES = 'series'; // Renomeado
  static const String COLUNA_EXERCICIO_REPETICOES = 'repeticoes'; // Renomeado
  static const String COLUNA_EXERCICIO_CARGA = 'carga'; // Renomeado
  static const String COLUNA_EXERCICIO_TIPO = 'tipo'; // Renomeado


  Future<Database> get database async {
    if (_bancoDeDados != null) return _bancoDeDados!;

    _bancoDeDados = await _iniciarBancoDeDados(); // Renomeado para _iniciarBancoDeDados
    return _bancoDeDados!;
  }

  _iniciarBancoDeDados() async { // Renomeado para _iniciarBancoDeDados
    String caminho = join(await getDatabasesPath(), NOME_BD); // Renomeado para caminho e NOME_BD
    return await openDatabase(
      caminho,
      version: VERSAO_BD, // Renomeado para VERSAO_BD
      onCreate: _aoCriar, // Renomeado para _aoCriar
      onUpgrade: _aoAtualizar, // Renomeado para _aoAtualizar
    );
  }

  Future _aoCriar(Database db, int version) async { // Renomeado para _aoCriar
    // Criar tabela de Rotinas
    await db.execute('''
      CREATE TABLE $TABELA_ROTINAS (
        $COLUNA_ROTINA_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $COLUNA_ROTINA_NOME TEXT NOT NULL,
        $COLUNA_ROTINA_OBJETIVO TEXT NOT NULL
      )
    ''');

    // Criar tabela de Exercícios
    await db.execute('''
      CREATE TABLE $TABELA_EXERCICIOS (
        $COLUNA_EXERCICIO_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $COLUNA_EXERCICIO_ID_ROTINA INTEGER NOT NULL,
        $COLUNA_EXERCICIO_NOME TEXT NOT NULL,
        $COLUNA_EXERCICIO_SERIES INTEGER NOT NULL,
        $COLUNA_EXERCICIO_REPETICOES TEXT NOT NULL,
        $COLUNA_EXERCICIO_CARGA TEXT NOT NULL,
        $COLUNA_EXERCICIO_TIPO TEXT NOT NULL,
        FOREIGN KEY ($COLUNA_EXERCICIO_ID_ROTINA) REFERENCES $TABELA_ROTINAS($COLUNA_ROTINA_ID) ON DELETE CASCADE
      )
    ''');
  }

  Future _aoAtualizar(Database db, int oldVersion, int newVersion) async { // Renomeado para _aoAtualizar
    // Implementar atualizações do esquema do banco de dados aqui.
    // Para simplificar durante o desenvolvimento, você pode descartar e recriar.
    // Para produção, você escreveria declarações ALTER TABLE.
    if (oldVersion < newVersion) {
      await db.execute('DROP TABLE IF EXISTS $TABELA_EXERCICIOS');
      await db.execute('DROP TABLE IF EXISTS $TABELA_ROTINAS');
      _aoCriar(db, newVersion); // Chamar o método _aoCriar para recriar as tabelas
    }
  }
}