import 'dart:convert';

import 'package:http/http.dart' as http ;

import 'package:seccion7_app_peliculas/src/models/pelicula_model.dart';

class PeliculasProvider{
  String _apiKey      ='c17c50a791c9ceb6f9ead000f4da8bd9';
  String _url         ='api.themoviedb.org';
  String _language    ='es-ES';


Future<List<Pelicula>> getEnCines() async{


      final url= Uri.https(_url,'3/movie/now_playing', {
          'api_key'   : _apiKey,
          'language'  : _language

      });

      final resp = await http.get( url );
      final decodedData = json.decode(resp.body);

      final peliculas = new Peliculas.fromJsonList(decodedData['results']);
      
      return peliculas.items;

}
}