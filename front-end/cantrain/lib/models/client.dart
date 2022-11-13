import 'dart:convert';

Client clientFromJson(String jsonString) => Client.fromJson(json.decode(jsonString)[0]);

String clientToJson(Client client) => json.encode(client.toJson());

class Client {

  static const String jsonId = "TRAINER_ID";
  static const String jsonTrainerUserId = "USER_ID";
  static const String jsonWebsiteUrl = "TRAINER_WEBSITE_URL";
  static const String jsonYoutubeUrl = "TRAINER_YOUTUBE_URL";
  static const String jsonInstagramUrl = "TRAINER_INSTAGRAM_URL";

  Client({
    required this.id,
    required this.userId,
    this.websiteUrl,
    this.youtubeUrl,
    this.instagramUrl,
  });

  int id;
  String userId;
  String? websiteUrl;
  String? youtubeUrl;
  String? instagramUrl;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json[jsonId],
    userId: json[jsonTrainerUserId],
    websiteUrl: json[jsonWebsiteUrl],
    youtubeUrl: json[jsonYoutubeUrl],
    instagramUrl: json[jsonInstagramUrl],
  );

  Map<String, dynamic> toJson() => {
    jsonId: id,
    jsonTrainerUserId: userId,
    jsonWebsiteUrl: websiteUrl,
    jsonYoutubeUrl: youtubeUrl,
    jsonInstagramUrl: instagramUrl,
  };

}
