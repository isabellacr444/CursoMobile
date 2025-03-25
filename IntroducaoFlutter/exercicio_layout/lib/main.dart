import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white, // Cor de Fundo
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipOval(
                  child: Image.asset("",
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
        ),
        
    ); 
  }
}
