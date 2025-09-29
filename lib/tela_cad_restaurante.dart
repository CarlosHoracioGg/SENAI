import 'package:flutter/material.dart';

class TelaCadRestaurante extends StatelessWidget{
  TelaCadRestaurante({super.key});
  
  @override
  Widget build(BuildContext context){
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
          DropdownButtonFormField(
              items: [
                DropdownMenuItem(value: "Japonesa",child: Text("Japonesa")),
                DropdownMenuItem(value: "Italiana",child: Text("Italiana")),
                DropdownMenuItem(value: "Brasileira",child: Text("Brasileira"))
              ], onChanged: (value){}),
          //Caixa de Texto
          TextFormField(
            decoration: const InputDecoration(hintText: 'Nome do Restauarante:'),
            validator: (String? value) {},
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Latitude:'),
            validator: (String? value) {},
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Longitude:'),
            validator: (String? value) {},
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Tipo de Restaurante:'),
            validator: (String? value) {},
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Usuário:'),
            validator: (String? value) {},
          ),
          SizedBox(height: 50),
          ElevatedButton(onPressed: (){}, child: Row(
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
