import 'package:flutter/material.dart';
import 'package:mimpedir/banco/restaurante_dao.dart';
import 'package:mimpedir/tela_cad_restaurante.dart';
import 'restaurante.dart';

class TelaHome extends StatefulWidget {
  TelaHome({super.key});

  @override
  State<TelaHome> createState() => TelaHomeState();
}
class TelaHomeState extends State<TelaHome>{
  List<Restaurante> restaurantes = [];
  @override

  void initState(){
    super.initState();
    carregarRestaurantes();
  }

  Future<void> carregarRestaurantes() async{
    final lista = await RestauranteDAO.listarTodos();
    setState(() {
      restaurantes = lista;
    });
  }
  @override
  /*Widget build(BuildContext context){
    return Scaffold(

    )
  }*/

}