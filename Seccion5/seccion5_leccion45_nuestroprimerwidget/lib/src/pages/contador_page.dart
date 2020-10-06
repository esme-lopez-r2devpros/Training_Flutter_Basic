import 'package:flutter/material.dart'; 


class ContadorPage extends StatefulWidget {

@override
createState() => _ContadorPageState();

}

class _ContadorPageState extends State<ContadorPage>{

final _estiloTexto = new TextStyle(fontSize: 25);

int  _conteo=0;

@override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
        centerTitle: true,
        elevation: 2.5,
        ),
        body: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text('Numero de taps:', style:_estiloTexto),
              Text('$_conteo', style:_estiloTexto),
            ],
          )
        ),
        floatingActionButton:

         FloatingActionButton(
         
         child: Icon(Icons.add),
          //child: Text('Hola'),
          onPressed: () {
           // print('Hola mundo!');
            
            setState(() {
_conteo++;
            }
            );
          },
          
          
         // onPressed: null, //Es como teener un disable true
        ),
        floatingActionButtonLocation: 
        FloatingActionButtonLocation.centerDocked,
    );
  }

}