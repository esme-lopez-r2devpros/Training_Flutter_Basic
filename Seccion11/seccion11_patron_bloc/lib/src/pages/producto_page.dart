import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:seccion11_patron_bloc/src/models/producto_model.dart';
import 'package:seccion11_patron_bloc/src/providers/productos_provider.dart';
import 'package:seccion11_patron_bloc/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {


  final formKey       = GlobalKey<FormState>();
  final scaffoldKey       = GlobalKey<ScaffoldState>();
  final productoProvider =  new ProductosProvider();
  ProductoModel producto=new ProductoModel();
  bool     _guardando     =false;
  File foto;

  @override
  Widget build(BuildContext context) {
    final ProductoModel prodData= ModalRoute.of(context).settings.arguments;
    if(prodData!=null)
    {
      producto=prodData;
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            //onPressed: _seleccionarFoto,
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _tomarFoto,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre(){
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto',
      ),
      onSaved: (value)=>producto.titulo=value,
      validator: (value){
        if(value.length<3)
        {
          return 'Ingrese un nombre más largo';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearPrecio(){
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio',
      ),
      onSaved: (value)=>producto.valor=double.parse(value),
      validator: (value){
        if(utils.isNumeric(value)){
          return null;
        }else{
          return 'Sólo números';
        }
      },
    );
  }

  Widget _crearBoton()
  {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: (_guardando)? null : _submit,
    );
  }

  Widget _crearDisponible(){
    return SwitchListTile(
      title: Text('Disponible'),
      value: producto.disponible,
      activeColor: Colors.deepPurple,
      onChanged: (value)=>setState((){
        producto.disponible=value;
      }),
    );
      
    
  }

  void _submit() async {


    if(!formKey.currentState.validate()) return;
    formKey.currentState.save();

    
    setState((){
    _guardando=true;  
    });

    if(foto!=null){
     producto.fotoUrl= await productoProvider.subirImagen(foto);
    }

    if(producto.id==null){
      productoProvider.crearProducto(producto);
    }else{
      productoProvider.editarProducto(producto);
    }

    //setState((){_guardando=false;});
    mostrarSnackbar('Registro guardado');
    Navigator.pushNamed(context, 'home');
    
  
    
  }

  void mostrarSnackbar(String mensaje){
    final snackbar= SnackBar(
      backgroundColor: Colors.deepPurple,
      content:  Text(mensaje),      
      duration: Duration(milliseconds: 1500)
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  Widget _mostrarFoto(){
   if (producto.fotoUrl != null) {
 
      return FadeInImage(
        image: NetworkImage(producto.fotoUrl),
        placeholder: AssetImage('assets/jar-loading (1).gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );
 
    } else {
 
      if( foto != null ){
        return Image.file(
          foto,
          fit: BoxFit.cover,
          height: 300.0,
        );
      }
      return Image.asset('assets/no-image.png');
    }
    }

  
  
   _seleccionarFoto() async {
   _procesarImagen(ImageSource.gallery);
  }

  _tomarFoto() async{
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource origen) async{
    final _picker = ImagePicker();
    final pickedFile= await _picker.getImage(source: origen);
    if(pickedFile!=null)
    {
       foto=File(pickedFile.path);
    }
   
    if(foto!=null){   
      producto.fotoUrl=null;
    }
 
    setState(() {});
  }
}
