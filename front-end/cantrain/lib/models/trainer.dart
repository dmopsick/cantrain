
import 'dart:convert';

Trainer trainerFromJson(String jsonString) => Trainer.fromJson(json.decode(jsonString)[0]);

String trainerToJson(Trainer trainer) => json.encode(trainer.toJson());

class Trainer {

  static const String jsonId = 'TRAINER_ID';
  static const String jsonUserId = 'USER_ID';
  static const String jsonWebsiteUrl = 'TRAINER_WEBSITE_URL';
  static const String jsonYoutubeUrl = 'TRAINER_YOUTUBE_URL';
  static const String jsonInstagramUrl = 'TRAINER_INSTAGRAM_URL';

  Trainer({
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
  
  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
    id: json[jsonId],
    userId: json[jsonUserId],
    websiteUrl: json[jsonWebsiteUrl],
    youtubeUrl: json[jsonYoutubeUrl],
    instagramUrl: json[jsonInstagramUrl],
  );

  Map<String, dynamic> toJson() => {
    jsonId: id,
    jsonUserId: userId,
    jsonWebsiteUrl: websiteUrl,
    jsonYoutubeUrl: youtubeUrl,
    jsonInstagramUrl: instagramUrl,
  };

}