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
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
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
          
           Widget _cardTipo2() {
return Card(
child: Column(
  children: [
    FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
     image:  NetworkImage('https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
     fadeInDuration: Duration(milliseconds: 200),
     height: 300.0,
     fit: BoxFit.cover,
    ),
    //Image(
      //image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
    //),
    Container(
      padding: EdgeInsets.all(10.0),
      child: Text('Imagen tomada en 2021')
      )
  ],
),
);
            }
}