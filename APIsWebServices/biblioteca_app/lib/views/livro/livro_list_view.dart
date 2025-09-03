import 'package:biblioteca_app/controllers/Livro_controller.dart'
    show LivroController;
import 'package:biblioteca_app/controllers/livro_controller.dart';
import 'package:biblioteca_app/models/livro_model.dart';
import 'package:biblioteca_app/views/livro/livro_form_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LivroListView extends StatefulWidget {
  const LivroListView({super.key});

  @override
  State<LivroListView> createState() => _LivroListViewState();
}

class _LivroListViewState extends State<LivroListView> {
  final _controller = LivroController();
  List<LivroModel> _livros = [];
  bool _carregando = true;
  //atributos para fazer a busca
  final _buscaField = TextEditingController();
  List<LivroModel> _livrosFiltrados = [];
  List<LivroModel> _livrosSelecionados = [];
  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  _carregarDados() async {
    setState(() {
      _carregando = true;
    });
    try {
      _livros = await _controller.fetchAll(); //busco no banco
      _livrosFiltrados = _livros; // copio
    } catch (e) {
      //Tratar Erro
    }
    setState(() {
      _carregando = false;
    });
  }

  //deletar livro
  void _deletar(LivroModel livro) async {
    if (livro.id == null) return;
    final confirmar = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirmar Exclusão"),
        content: Text("Tem certeza que deseja excluir ${livro.titulo}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text("Cancelar"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text("Excluir"),
          ),
        ],
      ),
    );
    if (confirmar == true) {
      try {
        await _controller.delete(livro.id!);
        _carregarDados();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Livro ${livro.titulo} excluído com sucesso!"),
          ),
        );
      } catch (e) {
        // Tratar erro
      }
    }

    //navegar para uma nova tela (formulario)
    void _abrirForm({LivroModel? livro}) async {
      //livro entra no parâmetro, não é obrigatório
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LivroFormView(livro: livro)),
      );
    }

    void _filtrar() {
      //filtar uma lista já carregada do BD
      final busca = _buscaField.text.toLowerCase();
      setState(() {
        _livrosFiltrados = _livros
            .where(
              (livro) =>
                  livro.titulo!.toLowerCase().contains(
                    busca,
                  ) //filtra pelo título do livro
                  ||
                  livro.autor!.toLowerCase().contains(
                    busca,
                  ), //filtra pelo autor do livro
            )
            .toList();
      });
    }

    //build
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: _carregando
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _buscaField,
                      decoration: InputDecoration(labelText: "Pesquisar Livro"),
                      onChanged: (value) => _filtrar(),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _livrosFiltrados.length,
                        itemBuilder: (context, index) {
                          final livro = _livrosFiltrados[index];
                          return Card(
                            child: ListTile(
                              leading: IconButton(
                                onPressed: () => _abrirForm(
                                  livro: livro,
                                ), //levar as informações do livro para tela de formulário
                                icon: Icon(Icons.edit),
                              ),
                              title: Text(livro.titulo!),
                              subtitle: Text(livro.autor!),
                              trailing: IconButton(
                                onPressed: () => _deletar(livro),
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                              //trailing -> icone para deletar o livro
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _abrirForm(),
          child: Icon(Icons.add),
        ),
      );
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
