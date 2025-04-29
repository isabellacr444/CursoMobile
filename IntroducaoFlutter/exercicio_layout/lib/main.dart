import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagem de Perfil
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: const Color.fromARGB(255, 0, 133, 241),
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Icon(
                    Icons.camera_alt,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    size: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Nome e Descrição
            Text(
              'Isabella Romão',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Desenvolvedora de sistema | Apaixonada por tecnologia e inovação',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(height: 20),

            // Linha com ícones de redes sociais
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.macro_off, color: const Color.fromARGB(255, 40, 158, 255)),
                  onPressed: () {},
                ),

      
                    IconButton(
                  icon: Icon(Icons.dangerous, color: const Color.fromARGB(255, 40, 158, 255)),
                  onPressed: () {},
                ),
                 IconButton(
                  icon: Icon(Icons.tab, color: const Color.fromARGB(255, 40, 158, 255)),
                  onPressed: () {},
                ),
          
              ],
            ),
            SizedBox(height: 20),

            // Container com 3 Containers em uma linha
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  color: const Color(0xFF0051FF),
                  child: Column(
                    children: [
                      Icon(Icons.work, color: const Color.fromARGB(255, 255, 255, 255)),
                      SizedBox(height: 8),
                      Text('Trabalho', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  color: const Color(0xFF0051FF),
                  child: Column(
                    children: [
                      Icon(Icons.school, color: const Color.fromARGB(255, 250, 250, 250)),
                      SizedBox(height: 8),
                      Text('Educação', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  color: const Color(0xFF0051FF),
                  child: Column(
                    children: [
                      Icon(Icons.favorite, color: const Color.fromARGB(255, 255, 255, 255)),
                      SizedBox(height: 8),
                      Text('Hobbies', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),

            // Lista de Texto (5 pelo menos)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
              'Interesses:',
                     textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
         Container(
                  padding: EdgeInsets.all(8),
                  color: const Color(0xFF0051FF),
                  child: Column(
                    children: [
                      Text('Desenvolvimento de Apps', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
                       Text('Inteligência Artificial', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
                       Text(' Design de Interface', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
                       Text(' Tecnologia em geral', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
                      
                    ],
                  ),
                ),
             
    
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
