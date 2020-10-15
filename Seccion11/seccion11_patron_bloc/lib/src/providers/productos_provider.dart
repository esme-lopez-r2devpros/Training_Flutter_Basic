

import 'dart:convert';

import 'package:seccion11_patron_bloc/src/models/producto_model.dart';
import 'package:http/http.dart' as http;

class ProductosProvider {



  final String _url='https://flutter-varios-561eb.firebaseio.com';

  Future<bool> crearProducto( ProductoModel producto) async{
    

    final url= '$_url/productos.json';
    final resp = await http.post(url, body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);

    print(decodedData);
    return true;
  }


}