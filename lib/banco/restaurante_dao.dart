import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:mimpedir/banco/database_helper.dart';
import 'package:mimpedir/banco/usuario_dao.dart';
import 'package:mimpedir/restaurante.dart';

class RestauranteDAO{

  static Future<List<Restaurante>> listarTodos() async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante');

    return resultado.map((mapa){
      return Restaurante(
        codigo: mapa['cd_restaurante'] as int,
        nomeRestaurante: mapa['nm_restaurante'] as String,

      );
    }).toList();
  }
  //pode dar erro
  static Future<int> cadastarRestaurante(
      String? nome, String? latitude, String? longitude, int? tipo
      ) async{

    final db = await DatabaseHelper.getDatabase();
    final dadosRestaurante = {
      'nm_restaurante': nome,
      'latitude_restaurante': latitude,
      'longitude_restaurante': longitude,
      'cd_tipo': tipo,
      'cd_usuario': UsuarioDAO.usuarioLogado.codigo
    };

    try{
      final idRestaurante = await db.insert('tb_restaurante', dadosRestaurante);
      return idRestaurante;
    }catch(e){
      print("Erro ao Cadastrar: $e");
      return -1;
    }
  }

}