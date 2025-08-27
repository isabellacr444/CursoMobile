//classe de modelagem do usuario (atributos)
class UsuarioModel {
  //atributos
  final String? id; //pode ser nulo inicialmente
  final String? nome;
  final String? email;

  //construtor
  UsuarioModel({this.id, this.nome, required this.email});

  //método para criar um objeto a partir de um mapa (fromJson)
  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      id: json["id"].toString(),
      nome: json["nome"].toString(),
      email: json["email"].toString()
    );
  }

  //método para converter um objeto em um mapa(toJson)
  Map<String, dynamic> toJson()=> {
    "id": id,
    "nome": nome,
    "email": email
  };
}

