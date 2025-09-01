import 'database_helper.dart';
import '../usuario.dart';

class UsuarioDAO{

  //Retorna um arquivo boleano assincrono,
  //sendo o autenticar precisando do login e senha.
  //o async é sempre quando precisa que algo ocorra para vc fazer algo,
  // usando para o futuro e liberando o await (await = espere)
  static Future<bool> autenticar(String login, String senha) async{

    // cria um objeto de nome fixo que espera o dbhelper, pegando seus dados
    final db = await DatabaseHelper.getDatabase();

    //cria um objeto de nome fixo que espera o db.query
    //puxando a tabela usuario, pedindo o login e senha que vao receber algo ( usando o ?)
    //e retornam com os argumentos (where.Args) login e senha.
    final resultado = await db.query(
      'tb_usuario',
      where: 'nm_login = ? and ds_senha = ?',
      whereArgs: [login, senha]
    );

    //retorna o resultado que nao esta vazio
    return resultado.isNotEmpty;
  }

}