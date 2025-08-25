import 'package:flutter/material.dart';
import 'usuario.dart';
import 'tipo.dart';
import 'restaurante.dart';
import 'tela_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    /*Usuario usuario =  Usuario(
        codigo: 1,
        login: "opiniaonaoconta",
        nome: "Carlos",
        senha: "@40028922"
    );*/


    return MaterialApp(
      // desativa o modo banner ( que exibe conteudo).
        debugShowCheckedModeBanner: false,
        home: TelaLogin(),
    );
  }
}