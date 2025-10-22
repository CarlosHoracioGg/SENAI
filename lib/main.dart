import 'package:flutter/material.dart';

import 'tela_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // desativa o modo banner ( que exibe conteudo).
        debugShowCheckedModeBanner: false,
        home: TelaLogin(),
    );
  }
}