import 'dart:convert';
import 'package:cantrain/models/dbuser.dart';

Client clientFromJson(String jsonString) => Client.fromJson(json.decode(jsonString)[0]);

String clientToJson(Client client) => json.encode(client.toJson());

class Client {

  static const String jsonId = 'CLIENT_ID';
  static const String jsonTrainerUserId = 'USED_ID';

  Client({
    required this.id,
    required this.user,
  });

  int id;
  DBUser user;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json[jsonId],
    // Create a nested DBUser model with the provided user fields that are included with all client records
    user: DBUser.fromJson(json),
  );

  Map<String, dynamic> toJson() => {
    jsonId: id,
    jsonTrainerUserId: user.id,
  };

}
