import 'package:flutter/material.dart';
import 'src/screens/loginUI.dart';
import 'src/models/listausuarios.dart';

import 'package:flutter/foundation.dart';
import 'dart:async';
import 'src/isolate.dart';

import 'src/models/usuario.dart';
import 'dart:convert';

final defaultTheme  = ThemeData(
  primaryColor: Color(0xFF125254),
  dividerColor: Color(0xFF125254),
  backgroundColor: Color(0xFFB0EACE),
);

void main() async{
  print(await compute(_calculate, 5));

  ListaUsuarios().createUsers(); //workkkkkk
  runApp(
    MaterialApp(
    theme: defaultTheme,
     title: 'Inicio do app',
     home: LoginUi(),
     //home: CadastroUsuarioUI(),
    ),
  );  
}

  // ...

  int _calculate(int value) {
    // this runs on another isolate
    return value * 2;
  }

  int _s(int value){
    String stringDeUsuarios = '''
   [
     {
        "image":"assets/joaquina.jpg",
        "nome":"Joaquina",
        "sobrenome":"Soares",
        "sexo":"Feminino",
        "cpf":"43850031810",
        "idade":"22",
        "cep":"12710400",
        "email":"joaquina@gmail.com",
        "senha":"123",
        "rua":"Via Dolorosa",
        "bairro":"Vila Celestina",
        "numero":"94",
        "transporte":"Carro",
        "myFriends":[]
      },
      {
        "image":"assets/maria.jpg",
        "nome":"Maria",
        "sobrenome":"Soares",
        "sexo":"Feminino",
        "cpf":"43850031810",
        "idade":"22",
        "cep":"12710400",
        "email":"maria@gmail.com",
        "senha":"123",
        "rua":"Orchard Road",
        "bairro":"Vila Celestina",
        "numero":"94",
        "transporte":"Carro",
        "myFriends":[]
      },
      {
        "image":null,
        "nome":"Joao",
        "sobrenome":"Soares",
        "sexo":"Masculino",
        "cpf":"43850031810",
        "idade":"22",
        "cep":"12710400",
        "email":"joao@gmail.com",
        "senha":"123",
        "rua":"Champs Elysees",
        "bairro":"Vila Celestina",
        "numero":"94",
        "transporte":"Carro",
        "myFriends":[1,2,3]
      },
      {
        "image":null,
        "nome":"Guilherme",
        "sobrenome":"Soares",
        "sexo":"Masculino",
        "cpf":"43850031810",
        "idade":"22",
        "cep":"12710400",
        "email":"guilherme.soares270@gmail.com",
        "senha":"123",
        "rua":"Marcio Pereira de Carvalho",
        "bairro":"Vila Celestina",
        "numero":"94",
        "transporte":"Carro",
        "myFriends":[0, 2]
      }
    ]
   ''';

    var jsonmap = jsonDecode(stringDeUsuarios);
  
    Usuario user;
    for(int i = 0; i < jsonmap.length; i++){
      user = Usuario.fromJson(jsonmap[i]);
      print('Adicionando ${user.nome}');
      ListaUsuarios().usuarios.add(user);
    }

    return 1;
  }