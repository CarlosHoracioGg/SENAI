import 'database_helper.dart';
import '../usuario.dart';

class UsuarioDAO{
  static Usuario usuarioLogado = Usuario();

  static Future<int> cadastrarUsuario(String nome, String login, String senha) async {
    final db = await DatabaseHelper.getDatabase();

    // Pega o maior ID existente na tabela
    final resultado = await db.rawQuery('SELECT MAX(cd_usuario) as maxId FROM tb_usuario');
    int proximoId = (resultado.first['maxId'] ?? 0) as int; // se não tiver, começa do 0
    proximoId++; // incrementa para o novo cadastro

    final dadosUsuario = {
      'cd_usuario': proximoId,
      'nm_usuario': nome,
      'nm_login': login,
      'ds_senha': senha
    };

    try {
      await db.insert('tb_usuario', dadosUsuario);
      return proximoId; // retorna o ID do novo usuário
    } catch (e) {
      print("Erro ao cadastrar: $e");
      return -1;
    }
  }


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

    //comentar sobre:
    usuarioLogado.codigo = resultado.first['cd_usuario'] as int;
    usuarioLogado.nome = resultado.first['nm_usuario'] as String;
    usuarioLogado.login = resultado.first['nm_login'] as String;
    usuarioLogado.senha = resultado.first['ds_senha'] as String;
    //retorna o resultado que nao esta vazio
    return resultado.isNotEmpty;
  }
  // a função abaixo serve pra exibir no console os dados da tb_usuario
  /*
  static Future imprimirUsuarios() async {
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_usuario');

    if (resultado.isEmpty) {
      print("A tabela tb_usuario está vazia.");
    } else {
      print("📌 Usuários cadastrados:");
      for (var usuario in resultado) {
        print(usuario);
    }
  }*/
}