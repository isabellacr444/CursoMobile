import 'package:biblioteca_app/controllers/Livro_controller.dart';
import 'package:biblioteca_app/controllers/livro_controller.dart';
import 'package:biblioteca_app/models/livro_model.dart';
import 'package:biblioteca_app/views/livro/livro_list_view.dart';
import 'package:flutter/material.dart';

class LivroFormView extends StatefulWidget {
  //atributo
  final LivroModel? livro; //pode ser nulo

  const LivroFormView({
    super.key,
    this.livro,
  }); //livro não é obrigatorio no construtor

  @override
  State<LivroFormView> createState() => _LivroFormViewState();
}

class _LivroFormViewState extends State<LivroFormView> {
  //atributos
  final _formKey = GlobalKey<FormState>(); //validação do formulário
  final _controller = LivroController(); //comunicação entre view e o model
  final _tituloField = TextEditingController(); //controlar o campo título
  final _autorField = TextEditingController(); //controllar o campo autor

  @override
  void initState() {
    super.initState();
    if (widget.livro != null) {
      _tituloField.text = widget
          .livro!
          .titulo!; //atribui o título do livro ao campo título do formulário
      _autorField.text = widget.livro!.autor!;
    }
  }

  //criar livro
  void _criar() async {
    if (_formKey.currentState!.validate()) {
      final livroNovo = LivroModel(
        id: DateTime.now().millisecond.toString(),
        titulo: _tituloField.text.trim(),
        autor: _autorField.text.trim(),
      );
      try {
        await _controller.create(livroNovo);
        //mensagem para o usuário
      } catch (e) {
        //mensagem de erro
      }
      Navigator.pop(context); //volta para a tela anterior
      //abre a tela de livro atualizando a tela
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LivroListView()),
      );
    }
  }

  //atualizar livro
  void _atualizar() async {
    if (_formKey.currentState!.validate()) {
      final livroAtualizado = LivroModel(
        id: widget.livro!.id, //id não altera
        titulo: _tituloField.text.trim(),
        autor: _autorField.text.trim(),
      );
      try {
        await _controller.update(livroAtualizado);
        //mensagem para o usuário
      } catch (e) {
        //mensagem de erro
      }
      Navigator.pop(context); //volta para a tela anterior
      //abre a tela de livro atualizando a tela
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LivroListView()),
      );
    }
  }

  //build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //operador Ternário
          widget.livro == null ? "Novo Livro" : "Editar Livro",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey, //responsável por validar o formulário
          child: Column(
            children: [
              TextFormField(
                controller: _tituloField,
                decoration: InputDecoration(labelText: "Título"),
                validator: (value) =>
                    value!.isEmpty ? "Informe o Título" : null,
              ),
              TextFormField(
                controller: _autorField,
                decoration: InputDecoration(labelText: "Autor"),
                validator: (value) => value!.isEmpty ? "Informe o Autor" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (widget.livro == null) {
                    _criar();
                  } else {
                    _atualizar();
                  }
                },
                child: Text(widget.livro == null ? "Criar" : "Atualizar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
