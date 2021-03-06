import 'package:flutter/foundation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamApi {
  static Future initUser(Client client,
      {@required String username,
      @required String urlImage,
      @required String id,
      @required String token}) async {
    final user = User(
      id: id,
      extraData: {
        'name': username,
        'image': urlImage,
      },
    );
    await client.setUser(user, token);
  }

  static Future<Channel> createChannel(
    Client client, {
    @required String type,
    @required String name,
    @required String image,
    @required String id,
    List<String> idMembers = const [],
  }) async {
    final channel = client.channel(type, id: id, extraData: {
      'name': name,
      'image': image,
      'members': idMembers,
    });

    await channel.create();

    channel.watch();
    return channel;
  }

  static Future<Channel> watchChannel(
    Client client, {
    @required String type,
    @required String id,
    List<String> idMembers = const [],
  }) async {
    final channel = client.channel(type, id: id);
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
    channel.watch();
    return channel;
  }
}
