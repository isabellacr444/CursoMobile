//classe de modelagem de emprestimos
class EmprestimoModel {
  //atributos
  final String? id; //pode ser nulo no inicio
  final String? livroId;
  final String? usuarioId;
  final DateTime? dataEmprestimo;
  final DateTime? dataDevolucao;

  //construtor
  EmprestimoModel({
    this.id,
    required this.livroId,
    required this.usuarioId,
    required this.dataEmprestimo,
    required this.dataDevolucao,
    required String usuario,
  });

  //método para criar um objeto a partir de um mapa (fromJson)
  factory EmprestimoModel.fromJson(Map<String, dynamic> json) {
    return EmprestimoModel(
      id: json["id"].toString(),
      livroId: json["livroId"].toString(),
      usuarioId: json["usuarioId"].toString(),
      dataEmprestimo: DateTime.parse(json["dataEmprestimo"]),
      dataDevolucao: DateTime.parse(json["dataDevolucao"]),
      usuario: '',
    );
  }

  //método para converter um objeto em um mapa(toJson)
  Map<String, dynamic> toJson() => {
    "id": id,
    "livroId": livroId,
    "usuarioId": usuarioId,
    "dataEmprestimo": dataEmprestimo?.toIso8601String(),
    "dataDevolucao": dataDevolucao?.toIso8601String(),
  };
}
