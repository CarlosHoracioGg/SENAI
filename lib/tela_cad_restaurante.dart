import 'package:flutter/material.dart';
import 'package:mimpedir/banco/tipo_dao.dart';
import 'package:mimpedir/tipo.dart';
import 'banco/restaurante_dao.dart';
import 'banco/tipo_dao.dart';
import 'tipo.dart';


class TelaCadRestaurante extends StatefulWidget {
  //TelaCadRestaurante({super.key});
  @override
  State<StatefulWidget> createState() {
    return TelaCadRestauranteState();
  }
}
class TelaCadRestauranteState extends State<TelaCadRestaurante> {

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  String? culinariaSelecionada;
  List<Tipo> tiposCulinaria =[];
  int? tipoCulinaria;

  void intState(){
    super.initState();
    carregarTipos();
  }

  Future<void> carregarTipos() async{
    final lista = await TipoDAO.listarTipos();
    setState(() {
      tiposCulinaria = lista;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Restaurante")),
      body: Padding(padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Informações do Restaurante: "),
            SizedBox(height: 40,),
            Text("Tipo de Comida:"),
            //Caixa de opções (combobox do java)
            DropdownButtonFormField<String>(
                value: culinariaSelecionada,
                items: tiposCulinaria.map((tipo){
                  return DropdownMenuItem<String>(
                    value: tipo.nome,
                    child: Text("${tipo.nome}"),
                  );
                }).toList(), onChanged: (value) {
                  culinariaSelecionada = value;
                  Tipo tipoSelecionado = tiposCulinaria.firstWhere(
                      (tipo)=> tipo.nome == value,
                  );
                  tipoCulinaria = tipoSelecionado.codigo;
            }),



            //Caixa de Texto
            TextFormField(
              decoration: const InputDecoration(hintText: 'Nome do Restauarante:'),
              validator: (String? value) {},
              controller: nomeController,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Latitude:'),
              validator: (String? value) {},
              controller: latitudeController,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Longitude:'),
              validator: (String? value) {},
              controller: longitudeController,
            ),
           /* TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Tipo de Restaurante:'),
              validator: (String? value) {},
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Usuário:'),
              validator: (String? value) {},
            ),*/
            SizedBox(height: 50),
            ElevatedButton(onPressed: () async{
              final sucesso = await RestauranteDAO.cadastarRestaurante(nomeController.text, latitudeController.text, longitudeController.text, tipoCulinaria);

              String msg = 'Erro: não cadastrado. Verifique os dados.';
              Color corFundo = Colors.red;
              if(sucesso > 0){
                  msg: '"${nomeController.text}"cadastrado com sucesso! ID: $sucesso';
                 corFundo = Colors.green;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(msg),
                  backgroundColor: corFundo,
                  duration: Duration(seconds: 5),
                )
              );
            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.save),
                Text("Cadastrar")
              ],
            ))

          ],
        ),
      ),
    );
  }
}


