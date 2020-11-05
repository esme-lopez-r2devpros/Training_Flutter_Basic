import 'package:demo_chat/config.dart';
import 'package:demo_chat/pages/channel_page.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'api/StreamApi.dart';

Future main() async {
  final client = Client(Config.apiKey, logLevel: Level.SEVERE);
  await StreamApi.initUser(client,
      username: 'Emily',
      urlImage:
          'https://image.freepik.com/vector-gratis/avatar-nina-sonriente_102172-32.jpg',
      id: Config.idEmily,
      token: Config.tokenEmily);
  final channel = await StreamApi.createChannel(
    client,
    type: 'messaging',
    id: '98261',
    name: 'Private Birthday Party',
    image:
        'https://www.oetker.co.uk/Recipe/Recipes/oetker.co.uk/uk-en/baking/image-thumb__3337__RecipeDetailsLightBox/sprinkles-birthday-cake.jpg',
    idMembers: [Config.idEmily, Config.idPeter],
  );

  /*final channel = await StreamApi.watchChannel(
    client,
    type: 'messaging',
    id: 'sample',    
  );*/

  runApp(MyApp(client: client, channel: channel));
}

class MyApp extends StatelessWidget {
  final Client client;
  final Channel channel;
  const MyApp({Key key, this.client, this.channel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Demo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Stream Chat', client: client, channel: channel),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Client client;
  final Channel channel;
  MyHomePage({Key key, this.title, this.client, this.channel})
      : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamChat(
        child: StreamChannel(
          child: ChannelPage(),
          channel: widget.channel,
        ),
        client: widget.client,
      ),
    );
  }
}
