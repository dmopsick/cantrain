import 'dart:convert';

import 'package:cantrain/utils/util.dart';

Exercise exerciseFromJson(String jsonString) => Exercise.fromJson(json.decode(jsonString)[0]);

String exerciseToJson(Exercise exercise) => json.encode(exercise.toJson());

class Exercise{

  static const String jsonId = 'EXERCISE_ID';
  static const String jsonTrainerId = 'TRAINER_ID';
  static const String jsonName = 'EXERCISE_NAME';
  static const String jsonInstructions = 'EXERCISE_INSTRUCTIONS';
  static const String jsonVideoLink = 'EXERCISE_VIDEO_LINK';
  static const String jsonPublic = 'PUBLIC_EXERCISE';

  Exercise({
    required this.id,
    required this.trainerId,
    required this.name,
    this.instructions,
    this.videoLink,
    required this.public,
  });

  int id;
  int trainerId;
  String name;
  String? instructions;
  String? videoLink;
  bool public;

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    id: json[jsonId],
    trainerId: json[jsonId],
    name: json[jsonName],
    instructions: json[jsonInstructions],
    videoLink: json[jsonVideoLink],
    public: Util().convertShortToBool(json[jsonPublic]),
  );

  Map<String, dynamic> toJson() => {
    jsonId: id,
    jsonTrainerId: trainerId,
    jsonName: name,
    jsonInstructions: instructions,
    jsonVideoLink: videoLink,
    jsonPublic: Util().convertBoolToShort(public),
  };

}
