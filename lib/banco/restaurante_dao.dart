import 'package:mimpedir/banco/database_helper.dart';
import 'package:mimpedir/banco/usuario_dao.dart';
import 'package:mimpedir/restaurante.dart';
import 'package:mimpedir/tipo.dart';
import 'package:mimpedir/banco/tipo_dao.dart';

class RestauranteDAO{

  static Future<void> atualizar(int? cd, String? nome, String? latitude, String? longitude, int? tipo) async{
    final db = await DatabaseHelper.getDatabase();
    final resultado= await db.update('tb_restaurante',
    {
      'nm_restaurante': nome,
      'latitude_restaurante': latitude,
      'longitude_restaurante': longitude,
      'cd_tipo': tipo,
     },
      where: 'cd_restaurante = ?',
      whereArgs: [cd]
    );
  }

  static Future<Restaurante> listar(int? cd) async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante',
    where:'cd_restaurante = ?',
    whereArgs: [cd]
    );
    return Restaurante(
      codigo: resultado.first['cd_restaurante'] as int,
      nomeRestaurante: resultado.first['nm_restuante'] as String,
      latitude: resultado.first['latitude_restaurante'] as String,
      longitude: resultado.first['longitude_restaurante'] as String,
      tipodeCulinaria: await TipoDAO.listar(resultado.first['cd_tipo']as int) as Tipo
    );
  }

  static Future<void> excluir(Restaurante r) async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante',
        where: 'cd_usuario = ?',
        whereArgs: [UsuarioDAO.usuarioLogado]
    );
  }

  static Future<List<Restaurante>> listarTodos() async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante');

    return resultado.map((mapa){
      return Restaurante(
        codigo: mapa['cd_restaurante'] as int,
        nomeRestaurante: mapa['nm_restaurante'] as String,tipodeCulinaria: Tipo()

      );
    }).toList();
  }


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