import 'dart:convert';

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
    required this.trainerId,
    required this.name,
    this.cycleLength,
  });

  int id;
  int trainerId;
  String name;
  int? cycleLength;

  factory Regiment.fromJson(Map<String, dynamic> json) => Regiment(
    id: json[jsonId],
    trainerId: json[jsonTrainerId],
    name: json[jsonName],
    cycleLength: json[jsonCycleLength],
  );

  Map<String, dynamic> toJson() => {
    jsonId: id,
    jsonTrainerId: trainerId,
    jsonName: name,
    jsonCycleLength: cycleLength,
  };

}
