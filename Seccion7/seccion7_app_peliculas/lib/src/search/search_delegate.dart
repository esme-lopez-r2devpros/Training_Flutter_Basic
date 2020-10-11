import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
      // Las acciones de nuestro appbar. por ejemplo un ico para eliminar el texto
      throw UnimplementedError();
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Icono a la izquierda del appbar
      throw UnimplementedError();
    }
  
    @override
    Widget buildResults(BuildContext context) {
      //Crea los resultados que vamos a mostrar
      throw UnimplementedError();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando las personas escriben
    throw UnimplementedError();
  }

}