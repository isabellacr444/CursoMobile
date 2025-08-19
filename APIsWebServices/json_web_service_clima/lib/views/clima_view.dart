import 'package:flutter/material.dart';

//clase que chama a mudança de estado
class ClimaView  extends StatefulWidget{
  const ClimaView({super.key});//cosntrutor da super

//metodo obrigatório para chamar as mudanças de estado
  @override
  State<StatefulWidget> createState() {
    return _ClimaViewState();
  }
}

//classe que representa o estado da tela
class _ClimaViewState extends State<ClimaView> {
  //atributos da classe
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}