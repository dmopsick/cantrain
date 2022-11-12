
import 'dart:convert';
import 'dbuser.dart';

Trainer trainerFromJson(String jsonString) => Trainer.fromJson(json.decode(jsonString)[0]);

String trainerToJson(Trainer trainer) => json.encode(trainer.toJson());

class Trainer {

  static const String jsonId = 'TRAINER_ID';
  static const String jsonUser = 'USER';
  static const String jsonWebsiteUrl = 'TRAINER_WEBSITE_URL';
  static const String jsonYoutubeUrl = 'TRAINER_YOUTUBE_URL';
  static const String jsonInstagramUrl = 'TRAINER_INSTAGRAM_URL';

  Trainer({
    required this.id,
    required this.user,
    this.websiteUrl,
    this.youtubeUrl,
    this.instagramUrl,
  });

  int id;
  DBUser user;
  String? websiteUrl;
  String? youtubeUrl;
  String? instagramUrl;
  
  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
    id: json[jsonId],
    user: DBUser.fromJson(json),
    websiteUrl: json[jsonWebsiteUrl],
    youtubeUrl: json[jsonYoutubeUrl],
    instagramUrl: json[jsonInstagramUrl],
  );

  Map<String, dynamic> toJson() => {
    jsonId: id,
    jsonUser: userToJson(user),
    jsonWebsiteUrl: websiteUrl,
    jsonYoutubeUrl: youtubeUrl,
    jsonInstagramUrl: instagramUrl,
  };

}