import 'package:flutter/material.dart';
import 'package:mimpedir/banco/usuario_dao.dart';
import 'package:mimpedir/tela_home.dart';
import 'package:mimpedir/tela_login.dart';
import 'package:mimpedir/usuario.dart';
class TelaCadUsuario extends StatelessWidget {
  TelaCadUsuario({super.key});


  //Função de capturar o texto inserido nos devidos inputs.
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    //Estrutura base de texto
    return Scaffold(
      appBar: AppBar(title: const Text("Tela de Cadastro")),
      //Espaço interno do corpo (se algo nao muda entao usa o const)
      body: Padding(padding: const EdgeInsets.all(24.0),
          child: Column(

            //Alinha tudo na tela
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextField(
                decoration: const InputDecoration(labelText: 'Nome'),
                controller: nomeController,
              ),
              const SizedBox(height: 20),
              //Exibe campo de inserir texto e uma decoracao pra exibir no topo "Usuario".
              TextField(
                decoration: const InputDecoration(labelText: 'Usuário'),
                controller: usuarioController,
              ),

              //Adiciona um espaço; exibe outro text para senha e a função de nao ver o texto (obscureText).
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                controller: senhaController,
              ),

              //Add um botão, precisando de uma ação pra executar e seu texto do botão.
              const SizedBox(height: 40),
              ElevatedButton(onPressed: () async {
                //objeto nome fixo que espera o envio dos dados dos inputs para o autenticar,
                //ele envia ao banco que se estiver com sintaxe correta ele retorna sim, tornando succeso igual a sim
                final sucesso = await UsuarioDAO.cadastrarUsuario(
                    nomeController.text,usuarioController.text, senhaController.text);

                Color corFundo = Colors.red;
                if (sucesso > 0) {
                  msg: '"${nomeController.text}"cadastrado com sucesso! ID: $sucesso';
                  corFundo = Colors.green;

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaHome())
                  );
                } else {
                  //Função pra exibir uma notificação(SnackBar) na tela de login efetuado.
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Login ou sennha inválidos."))
                  );
                }
              }, child: Text("Cadastro")),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () async{
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaLogin())
                );
              }, child: Text("Login"))

            ],
          )
      ),
    );
  }
}