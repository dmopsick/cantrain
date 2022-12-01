import 'dart:convert';

import 'package:cantrain/models/trainer.dart';

Regiment regimentFromJson(String jsonString) => Regiment.fromJson(json.decode(jsonString)[0]);

String regimentToJson(Regiment regiment) => json.encode(regiment.toJson());

class Regiment {

  // Define the field names used in the JSON
  static const String jsonId = 'REGIMENT_ID';
  static const String jsonTrainerId = 'TRAINER_ID';
  static const String jsonName = 'REGIMENT_NAME';
  static const String jsonCycleLength = 'REGIMENT_CYCLE_LENGTH';

  Regiment({
    required this.id,
    required this.trainer,
    required this.name,
    this.cycleLength,
  });

  int id;
  Trainer trainer;
  String name;
  int? cycleLength;

  factory Regiment.fromJson(Map<String, dynamic> json) => Regiment(
    id: json[jsonId],
    trainer: Trainer.fromJson(json),
    name: json[jsonName],
    cycleLength: json[jsonCycleLength],
  );

  Map<String, dynamic> toJson() => {
    jsonId: id,
    jsonTrainerId: trainer.id,
    jsonName: name,
    jsonCycleLength: cycleLength,
  };

}
