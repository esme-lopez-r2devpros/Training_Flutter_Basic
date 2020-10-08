import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Avatar Page'),
      actions: [
        Container(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://s03.s3c.es/imag/_v2/ecodiario/cultura/225x250/brave-merida.jpg'),
          radius:30.0,
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            child: Text('SL'),
            backgroundColor: Colors.purple,
          ),
        )
      ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('http://deadcurious.com/wp-content/uploads/2012/12/Brave_Merida_hair_archery1-960x1024.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif') ,
          fadeInDuration: Duration( milliseconds: 200)
        ),
      ),
    );
  }
}