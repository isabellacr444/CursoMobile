//classe de modelagem dos livros
//atributos
class LivroModel {
  final String? id; //pode ser nulo no inicio
  final String? titulo;
  final String? autor;
  final bool? disponivel;

  //construtor
  LivroModel({
    this.id,
    required this.titulo,
    required this.autor,
    this.disponivel = true,
  });

  //método para criar um objeto a partir de um mapa (fromJson)
  factory LivroModel.fromJson(Map<String, dynamic> json) {
    return LivroModel(
      id: json["id"].toString(),
      titulo: json["titulo"].toString(),
      autor: json["autor"].toString(),
      disponivel: json["disponivel"] == true
          ? true
          : false, //se for 1 é true, se for 0 é false
    );
  }

  //método para converter um objeto em um mapa(toJson)
  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "autor": autor,
    "disponivel": disponivel,
  };
}
