import 'package:flutter/material.dart';

import 'package:leccion6_componentes/src/providers/menu_providers.dart'; 


class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Componentes'),
    ),
    body:_lista(),
    );
  }

  Widget _lista() {
  //print(menuProvider.opciones);
  //menuProvider.cargarData()
   
   return FutureBuilder(
     future: menuProvider.cargarData(),
     initialData: [],
builder: ( context, AsyncSnapshot<List<dynamic>> snapshot){

print(snapshot.data);

      return ListView(
      children: _listaItems(snapshot.data),
       );
     },
     
   );


    
        }
      
       List<Widget> _listaItems(List<dynamic> data) {
         

final List<Widget> opciones= [];

data.forEach((opt){

final widgetTemp=ListTile(
  title: Text(opt['texto']),
  leading: Icon(Icons.accessible, color:Colors.blue),
  trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
  onTap: (){

  },
);

opciones..add(widgetTemp)
..add(Divider());
});

return opciones;

       }
}