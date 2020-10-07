import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1()
                  ],
          
                ),
              );
            }


          
           Widget _cardTipo1() {
return Card(
  child: Column(
    children: [
      ListTile(
        leading: Icon(Icons.photo_album, color:Colors.blue),
        title: Text('Soy el título de esta tarjeta'),
        subtitle: Text('Aquí estamos en la descripción de la tarjeta que quiero que ustedes vean que quiero mostrarles. Hoy es Miércoles'),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
FlatButton(onPressed: () {}, child: Text('Cancelar')),
FlatButton(onPressed: () {}, child: Text('Ok')),
      ],)
    ],
  ),
);
            }
}