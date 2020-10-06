import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {  

  final opciones= ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
         //children: _crearItems()
         children: _crearItemsCorta()
      ),
    );
  }

List<Widget> _crearItems()
{

  List<Widget> lista =new List<Widget>();
  for (String opt in opciones) {
    final tempWidget=ListTile(
      title: Text(opt),
    );

    lista..add(tempWidget)
    ..add(Divider( color: Colors.blue[200], thickness: 4.0, height: 0.1));
  }
  return lista;
}

List<Widget> _crearItemsCorta()
{
return opciones.map( (item) 
{
return Column(
  children: [
        ListTile(
    
      title: Text(item + '!'),
    subtitle: Text('Cualquier cosa'),
    leading: Icon(Icons.access_time),
    trailing: Icon(Icons.keyboard_arrow_right),
    onTap: (){},
    ),
    Divider()
  ],
);
}
).toList();

}



}