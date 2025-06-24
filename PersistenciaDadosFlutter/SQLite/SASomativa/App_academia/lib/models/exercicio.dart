// lib/models/exercicio.dart
class Exercicio { 
  int? id;
  int idRotina; // Renomeado para idRotina (Chave estrangeira)
  String nome; 
  int series; 
  String repeticoes; 
  String carga; 
  String tipo; 

  Exercicio({
    this.id,
    required this.idRotina, // Precisa ser passado
    required this.nome,
    required this.series,
    required this.repeticoes,
    required this.carga,
    required this.tipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idRotina': idRotina, // Nome da chave no mapa também atualizado
      'nome': nome,
      'series': series,
      'repeticoes': repeticoes,
      'carga': carga,
      'tipo': tipo,
    };
  }

  factory Exercicio.fromMap(Map<String, dynamic> map) {
    return Exercicio(
      id: map['id'],
      idRotina: map['idRotina'], // Nome da chave no mapa também atualizado
      nome: map['nome'],
      series: map['series'],
      repeticoes: map['repeticoes'],
      carga: map['carga'],
      tipo: map['tipo'],
    );
  }

  @override
  String toString() {
    return 'Exercicio{id: $id, idRotina: $idRotina, nome: $nome, series: $series, repeticoes: $repeticoes, carga: $carga, tipo: $tipo}';
  }
}
