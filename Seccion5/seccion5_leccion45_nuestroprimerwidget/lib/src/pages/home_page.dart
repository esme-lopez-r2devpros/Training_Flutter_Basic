import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

@override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        ),
        body: Center(
          child: Text('Hola mundo'),
        ),
    );
  }

}