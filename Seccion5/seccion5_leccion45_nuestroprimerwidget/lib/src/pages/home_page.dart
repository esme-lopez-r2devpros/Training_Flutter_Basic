import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

@override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true,
        elevation: 2.5,
        ),
        body: Center(
          child: Text('Hola mundo'),
        ),
    );
  }

}