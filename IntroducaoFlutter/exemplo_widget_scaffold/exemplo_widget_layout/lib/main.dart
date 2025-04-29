import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      //routes - rotas de navegação +1 tela
    ),
  );
}

//Janela para estudo de Layout (Colums,Rows,Stacks,Containers)
class MyApp extends StatelessWidget {
  //sobreestrever o método build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //suporte da janela);
      appBar: AppBar(title: Text("Exemplo de Layout")),
      body: Container(
      color: const Color.fromARGB(255, 47, 123, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.black,
              height: 200,
              width: 200,
            ),
            Container(
              color: const Color.fromARGB(255, 30, 248, 248),
              height: 150,
              width: 150,
            ),
            Icon(Icons.person, size: 100)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                Container(
                  color: const Color.fromARGB(255, 92, 0, 197),
                  height: 100,
                  width: 100,
                ),
                Container(
                  color: const Color.fromARGB(255, 40, 213, 243),
                  height: 100,
                  width: 100,),
                Container(
                  color: const Color.fromARGB(255, 1, 17, 240),
                  height: 100,
                  width: 100,)
          ],
        ),
        Text("Observações importantes")
      ]),
        ),
    );
  }
}
