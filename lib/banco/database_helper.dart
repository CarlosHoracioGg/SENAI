import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  //dá um nome do banco definindo seu nome fixo (usando final), nao podendo ser alterado
  static final _nomeBanco = 'Solucao_Completa.db';

  //Cria um objeto que pode armazenar um dado do tipo Data Base, armazenando ao conexao (que será aberta) do banco
  static Database? _db;

  //Isso vai exibir um arquivo que no futuro será Database
  static Future<Database> getDatabase() async{
    if(_db != null) return _db!;

    //crio a var do tipo DIRETORIO que pega o diretório das pastas do dispositivo que instalei o app
    Directory pastabanco = await getApplicationDocumentsDirectory();

    //caminho para conectar o caminho com o banco (solucao-completa)
    String caminho = join(pastabanco.path, _nomeBanco);

    //Verifica se o caminho nao existe (por conta do: !)
    if(!File(caminho).existsSync()){

      //Carrega o conteudo da pasta assets
      ByteData data = await rootBundle.load('assets/$_nomeBanco');

      //converte o conteudo em uma lista em bytes
      List<int> bytes = data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);

      //cria um arquivo e escreve os bytes nele
      await File(caminho).writeAsBytes(bytes);

    }

    //executa o banco
    _db = await openDatabase(caminho);

    //retorna ele pra usar em outras coisas
    return _db!;
  }

}