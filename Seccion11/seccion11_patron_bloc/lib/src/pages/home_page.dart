import 'package:flutter/material.dart';
import 'package:seccion11_patron_bloc/src/bloc/provider.dart';
import 'package:seccion11_patron_bloc/src/models/producto_model.dart';
import 'package:seccion11_patron_bloc/src/providers/productos_provider.dart';

class HomePage extends StatelessWidget {
  final productosProvider= new ProductosProvider();
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }


  Widget _crearListado(){
     return  FutureBuilder(
        future: productosProvider.cargarProductos(),        
        builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
          if(snapshot.hasData){
            return Container();
          }
          else{
            return Center(child: CircularProgressIndicator());
          }          
        },
      );
  }

  _crearBoton(BuildContext context){
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      child: Icon(Icons.add),
      onPressed: ()=> Navigator.pushNamed(context, 'producto')
    );
  }
}