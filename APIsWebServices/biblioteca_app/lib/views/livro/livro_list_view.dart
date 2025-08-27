import 'package:flutter/material.dart';

class LivroListView extends StatefulWidget {
  const LivroListView({super.key});

  @override
  State<LivroListView> createState() => _LivroListViewState();
}

class _LivroListViewState extends State<LivroListView> {

  //atributos
  final _livros = [
    //aqui vão os livros
    LivroModel(id: "1", titulo: "1984", autor: "George Orwell"),
    LivroModel(id: "2", titulo: "O Senhor dos Anéis", autor: "J.R.R. Tolkien"),
    LivroModel(id: "3", titulo: "Dom Casmurro", autor: "Machado de Assis"),
  ];
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}