import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() async{
  //garantir o carregamanetos do widgets primeiro
  WidgetsFlutterBinding.ensureInitialized();

  //conectar com o firebase
  await Firebase.initializeApp();

  runApp(MaterialApp(
    title: "Cine Favorite",
    theme: themeData(
      primarySwatch: Colors.orange,
      brightness: Brightness.dark,
    ),
    home: AuthStream(),//permite a navegação da tela
  ));
}

class AuthStream extends StatefulWidget{
  const AuthStream({super.key});

  @override
  Widget build(BuildContext context){
    //ouvinte das mudanças de estado
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (content, snapshot){//analisa o instantaneo da aplicaçao 
      //se tiver logado, vai para a tela de favoritos
        if(snapshot.hasData){
          return FavoriteView();
        //caso contrario => tela de login
       
        }
        return LoginView();
        
      }
      );
  }}