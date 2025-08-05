//converter Json <-> Dart
import 'dart:convert'; //não precisa instalar no PubSpec /Nativa do Dart

void main() {
  //converter Json -> Dart
  String jsonString = '''
  {
    "id": "abc123",
    "nome": "João Pedro",
    "idade": 30,
    "ativo": true,
    "login":"UserPedro",
    "password":"12345"
  }''';

  //decode -> converte Json String para Map
  Map<String, dynamic> usuario = jsonDecode(jsonString);
  print('Nome: ${usuario['nome']}');
  print('Login: ${usuario['login']}');

  //modificar a senha para 6 digitos /salvar no JsonString
  usuario['password'] = '123456';

  //gravar o Map alterado em Json String
  jsonString = jsonEncode(usuario);
  print(jsonString);

}
