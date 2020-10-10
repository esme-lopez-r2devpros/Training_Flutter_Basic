import 'package:flutter/material.dart';
import 'package:seccion7_app_peliculas/src/providers/peliculas_provider.dart';
import 'package:seccion7_app_peliculas/src/widgets/card_swiper_widget.dart';



class HomePage extends StatelessWidget {
   final peliculasProvider = new PeliculasProvider();
   
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
           mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _swiperTarjetas(),
          _footer(context)
        ],
      ),
      )
     
      );         
  }

  Widget _swiperTarjetas(){
       
      return FutureBuilder(
        future: peliculasProvider.getEnCines(),        
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          
          if(snapshot.hasData){
              return CardSwiper( peliculas: snapshot.data) ;
          }        
          else{
            return Container(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator()
                )
             );
          }        
        },
      );


      
      //return CardSwiper(
      // peliculas: [1,2,3,4,5],
      //);
  }

  Widget _footer( BuildContext context){
    return Container(
        width: double.infinity,
        child: Column(
           children: [
             Text('Populares', style: Theme.of(context).textTheme.subtitle1),
             FutureBuilder(
               future: peliculasProvider.getPopulares(),               
               builder: (BuildContext context, AsyncSnapshot<List> snapshot) {              
                 snapshot.data?.forEach((p) =>print(p.title));
               return Container();                 
               },
             ),
           ],
        )
    );
  }
}