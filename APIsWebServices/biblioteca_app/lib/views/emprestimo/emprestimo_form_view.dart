import 'package:biblioteca_app/controllers/emprestimo_controller.dart';
import 'package:biblioteca_app/models/Emprestimo_model.dart';
import 'package:biblioteca_app/models/emprestimo_model.dart';
import 'package:flutter/material.dart';

class EmprestimoFormView extends StatefulWidget {
  final EmprestimoModel? emprestimo;

  const EmprestimoFormView({super.key, this.emprestimo});

  @override
  State<EmprestimoFormView> createState() => _EmprestimoFormViewState();
}

class _EmprestimoFormViewState extends State<EmprestimoFormView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = EmprestimoController();
  final _usuarioField = TextEditingController();
  final _livroField = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.emprestimo != null) {
      _usuarioField.text = widget.emprestimo!.usuarioId ?? '';
      _livroField.text = widget.emprestimo!.livroId ?? '';
    }
  }

  void _criar() async {
    if (_formKey.currentState!.validate()) {
      final emprestimoNovo = EmprestimoModel(
        id: DateTime.now().millisecond.toString(),
        usuarioId: _usuarioField.text.trim(),
        livroId: _livroField.text.trim(),
        dataEmprestimo: null,
        dataDevolucao: null,
        usuario: '',
      );
      try {
        await _controller.create(emprestimoNovo as EmprestimoModel);
      } catch (e) {
        //mensagem de erro
      }
      Navigator.pop(context);
    }
  }

  void _atualizar() async {
    if (_formKey.currentState!.validate()) {
      final emprestimoAtualizado = EmprestimoModel(
        id: widget.emprestimo!.id,
        usuarioId: _usuarioField.text.trim(),
        livroId: _livroField.text.trim(),
        dataEmprestimo: widget.emprestimo!.dataEmprestimo,
        dataDevolucao: widget.emprestimo!.dataDevolucao,
        usuario: widget.emprestimo!.usuario ?? '',
      );
      try {
        await _controller.update(emprestimoAtualizado);
      } catch (e) {
        //mensagem de erro
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.emprestimo == null ? "Novo Empréstimo" : "Editar Empréstimo",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usuarioField,
                decoration: InputDecoration(labelText: "Usuário"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Informe o Usuário" : null,
              ),
              TextFormField(
                controller: _livroField,
                decoration: InputDecoration(labelText: "Livro"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Informe o Livro" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (widget.emprestimo == null) {
                    _criar();
                  } else {
                    _atualizar();
                  }
                },
                child: Text(widget.emprestimo == null ? "Criar" : "Atualizar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
