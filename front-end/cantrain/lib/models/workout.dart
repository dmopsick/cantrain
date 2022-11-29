import 'dart:convert';

Workout workoutFromJson(String jsonString) => Workout.fromJson(json.decode(jsonString)[0]);

String workoutToJson(Workout workout) => json.encode(workout.toJson());

class Workout {

  static const String jsonId = 'WORKOUT_ID';
  static const String jsonTrainerId = 'TRAINER_ID';
  static const String jsonWorkoutName = 'WORKOUT_NAME';
  static const String jsonWorkoutDescription = 'WORKOUT_DESCRIPTION';

  Workout({
    required this.id,
    required this.trainerId,
    required this.workoutName,
    this.workoutDescription,
  });

  int id;
  int trainerId;
  String workoutName;
  String? workoutDescription;

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
    id: json[jsonId],
    trainerId: json[jsonTrainerId],
    workoutName: json[jsonWorkoutName],
    workoutDescription: json[jsonWorkoutDescription],
  );

  Map<String, dynamic> toJson() => {
    jsonId: id,
    jsonTrainerId: trainerId,
    jsonWorkoutName: workoutName,
    jsonWorkoutDescription: workoutDescription,
  };
  
}
