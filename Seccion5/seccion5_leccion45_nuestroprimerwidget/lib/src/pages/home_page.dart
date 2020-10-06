import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

final estiloTexto = new TextStyle(fontSize: 25);

@override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true,
        elevation: 2.5,
        ),
        body: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text('Numero de clicks:', style:estiloTexto),
              Text('0', style:estiloTexto),
            ],
          )
        ),
        floatingActionButton:

         FloatingActionButton(
         
         child: Icon(Icons.add),
          //child: Text('Hola'),
          onPressed: () {
            print('Hola mundo!');
          },
          
          
         // onPressed: null, //Es como teener un disable true
        ),
        floatingActionButtonLocation: 
        FloatingActionButtonLocation.centerDocked,
    );
  }

}