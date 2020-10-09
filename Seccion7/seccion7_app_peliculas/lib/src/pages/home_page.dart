import 'package:flutter/material.dart';
import 'package:seccion7_app_peliculas/src/providers/peliculas_provider.dart';
import 'package:seccion7_app_peliculas/src/widgets/card_swiper_widget.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
          )
        ],
      ),
      body: Container(
         child: Column(
        children: [
          _swiperTarjetas(),
        ],
      ),
      )
     
      );         
  }

  Widget _swiperTarjetas(){
        final peliculasProvider = new PeliculasProvider();
        peliculasProvider.getEnCines();
      return CardSwiper(
        peliculas: [1,2,3,4,5],
      );
  }
}