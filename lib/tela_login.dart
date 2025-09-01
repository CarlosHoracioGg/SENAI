import 'package:flutter/material.dart';
import 'usuario.dart';
import 'tela_home.dart';
import 'banco/usuario_dao.dart';

class TelaLogin extends StatelessWidget{
  TelaLogin({super.key});

  //Função de capturar o texto inserido nos devidos inputs.
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();


  @override
  Widget build(BuildContext context){
    //Estrutura base de texto
    return Scaffold(
      appBar: AppBar(title: const Text("Tela de Login")),
      //Espaço interno do corpo (se algo nao muda entao usa o const)
      body: Padding(padding: const EdgeInsets.all(24.0),
          child: Column(

            //Alinha tudo na tela
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

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
              ElevatedButton(onPressed: () async{

                //objeto nome fixo que espera o envio dos dados dos inputs para o autenticar,
                //ele envia ao banco que se estiver com sintaxe correta ele retorna sim, tornando succeso igual a sim
                final sucesso = await UsuarioDAO.autenticar(usuarioController.text, senhaController.text);

                if(sucesso){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TelaHome())
                );

                }else {
                //Função pra exibir uma notificação(SnackBar) na tela de login efetuado.
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Login ou sennha inválidos."))
                );
                }
              }, child: Text("Login"))

            ],
          )
      ),
    );
  }
}