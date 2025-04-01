import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Lista para armazenar as imagens
  List<String> _imagens = [
    "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
    "https://images.unsplash.com/photo-1521747116042-5a810fda9664",
    "https://images.unsplash.com/photo-1504384308090-c894fdcc538d",
    "https://images.unsplash.com/photo-1518837695005-2083093ee35b",
    "https://images.unsplash.com/photo-1501594907352-04cda38ebc29",
    "https://images.unsplash.com/photo-1519681393784-d120267933ba",
    "https://images.unsplash.com/photo-1531259683007-016a7b628fc3",
    "https://images.unsplash.com/photo-1506619216599-9d16d0903dfd",
    "https://images.unsplash.com/photo-1494172961521-33799ddd43a5",
    "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4",
  ];

  TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Galeria de Imagens"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            // Botão para adicionar imagem
            ElevatedButton(
              onPressed: _mostrarDialogAdicionarImagem,
              child: Text("Adicionar Imagem"),
            ),
            // Galeria de imagens em grade
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Quantidade de imagens por linha
                  crossAxisSpacing: 8, // Espaçamento entre colunas
                  mainAxisSpacing: 8, // Espaçamento entre linha
                ),
                itemCount: _imagens.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => _mostrarImagem(context, _imagens[index]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(_imagens[index], fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função para mostrar a imagem em tela cheia
  void _mostrarImagem(BuildContext context, String imagem) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Image.network(imagem),
      ),
    );
  }

  // Função para mostrar o diálogo para adicionar imagem
  void _mostrarDialogAdicionarImagem() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Adicionar Imagem"),
        content: TextField(
          controller: _urlController,
          decoration: InputDecoration(hintText: "Digite a URL da imagem"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Verifica se a URL não está vazia e a adiciona à lista
              if (_urlController.text.isNotEmpty) {
                setState(() {
                  _imagens.add(_urlController.text);
                });
                _urlController.clear();
              }
              Navigator.pop(context);
            },
            child: Text("Adicionar"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"),
          ),
        ],
      ),
    );
  }
}
