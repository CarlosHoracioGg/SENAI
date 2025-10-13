import 'package:mimpedir/banco/database_helper.dart';

import '../tipo.dart';

class TipoDAO{

  static Future<List<Tipo>> listarTipos() async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_tipo');

    //Mapeia a tabela e lista os resultados atraves do map
    return resultado.map((mapa){
      return Tipo(
        codigo: mapa['cd_tipo'] as int,
        nome: mapa['nm_tipo'] as String
      );
    }).toList();
  }
}