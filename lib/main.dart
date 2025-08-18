import 'package:flutter/material.dart';
import 'usuario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    Usuario usuario =  Usuario(
      codigo: 1,
      Login: "opiniaonaoconta",
      nome: "Carlos",
      senha: "@40028922"
    );


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Meus Dados")

        ),
        body: Center(
          child: Padding(padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text("Nome: ${usuario.nome}"),
              Text("Código: ${usuario.codigo}"),
              Text("Login: ${usuario.Login}"),
              Text("Senha: ${usuario.senha}")
            ],
          ))
        )

      )
    );
  }
}