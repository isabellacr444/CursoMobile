import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MaterialApp(home: LocationScreen()));
}

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  //atributos
  String mensagem = "";

  //método para pegar a localização atual do dispositivo
  void getLocation() async {
    bool servicoDisponivel;
    LocationPermission permissao;

    //verifica se o serviço esta dispo
    servicoDisponivel = await Geolocator.isLocationServiceEnabled();
    if (!servicoDisponivel) {
      mensagem = "Serviço de localização desabilitado";
    }
    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        mensagem = "Permissão de localização negada";
      }
    }
  }
    Position

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
