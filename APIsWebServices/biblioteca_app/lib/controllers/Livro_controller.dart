import 'package:biblioteca_app/models/livro_model.dart';
import 'package:biblioteca_app/services/api_service.dart';

class LivroController {
  // Métodos para manipulação de livros
  Future<List<LivroModel>> fetchAll() async {
    final list = await ApiService.getList("livros?_sort=titulo");
    return list.map<LivroModel>((e) => LivroModel.fromJson(e)).toList();
  }

  Future<LivroModel> fetchOne(String id) async {
    final livro = await ApiService.getOne("livros", id);
    return LivroModel.fromJson(livro);
  }

  Future<LivroModel> create(LivroModel livro) async {
    final created = await ApiService.post("livros", livro.toJson());
    return LivroModel.fromJson(created);
  }

  Future<LivroModel> update(LivroModel livro) async {
    final updated = await ApiService.put("livros", livro.toJson(), livro.id!);
    return LivroModel.fromJson(updated);
  }

  Future<void> delete(String id) async {
    await ApiService.delete("livros", id);
  }
}
