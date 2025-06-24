// lib/services/auxiliar_banco_dados.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AuxiliarBancoDados { 
  static Database? _bancoDeDados; 
  static const String NOME_BD = 'training_app.db'; 
  static const int VERSAO_BD = 1; 

  // Nomes das tabelas
  static const String TABELA_ROTINAS = 'rotinas'; 
  static const String TABELA_EXERCICIOS = 'exercicios'; 

  // Colunas da tabela de Rotinas
  static const String COLUNA_ROTINA_ID = 'id';
  static const String COLUNA_ROTINA_NOME = 'nome';
  static const String COLUNA_ROTINA_OBJETIVO = 'objetivo'; 

  // Colunas da tabela de Exercícios
  static const String COLUNA_EXERCICIO_ID = 'id'; 
  static const String COLUNA_EXERCICIO_ID_ROTINA = 'idRotina'; 
  static const String COLUNA_EXERCICIO_NOME = 'nome'; 
  static const String COLUNA_EXERCICIO_SERIES = 'series'; 
  static const String COLUNA_EXERCICIO_REPETICOES = 'repeticoes'; 
  static const String COLUNA_EXERCICIO_CARGA = 'carga'; 
  static const String COLUNA_EXERCICIO_TIPO = 'tipo'; 


  Future<Database> get database async {
    if (_bancoDeDados != null) return _bancoDeDados!;

    _bancoDeDados = await _iniciarBancoDeDados(); // Renomeado para _iniciarBancoDeDados
    return _bancoDeDados!;
  }

  _iniciarBancoDeDados() async { 
    String caminho = join(await getDatabasesPath(), NOME_BD); 
    return await openDatabase(
      caminho,
      version: VERSAO_BD, 
      onCreate: _aoCriar, 
      onUpgrade: _aoAtualizar, 
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
    if (oldVersion < newVersion) {
      await db.execute('DROP TABLE IF EXISTS $TABELA_EXERCICIOS');
      await db.execute('DROP TABLE IF EXISTS $TABELA_ROTINAS');
      _aoCriar(db, newVersion); 
    }
  }
}