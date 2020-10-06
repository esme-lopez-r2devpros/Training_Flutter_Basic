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
        floatingActionButtonLocation: 
        FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _crearBotones()              
          
         // onPressed: null, //Es como teener un disable true
               
    );
  }


  Widget _crearBotones(){
    return Row(
      mainAxisAlignment:MainAxisAlignment.end,
children:<Widget>[
  SizedBox(width:30.0),
FloatingActionButton(child: Icon(Icons.exposure_zero), onPressed:_reset),
Expanded(child: SizedBox()),
FloatingActionButton(child: Icon(Icons.remove), onPressed:_sustraer),
SizedBox(width:5.0),
FloatingActionButton(child: Icon(Icons.add), onPressed:_agregar),
],
);
    
  }

  void _agregar()
  {   
    setState(()=>_conteo++);
  }

  void _sustraer()
  {
    setState(() => _conteo--);
  }

void _reset(){
  setState(()=> _conteo=0);
}


}