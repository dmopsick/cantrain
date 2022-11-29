import 'package:cantrain/models/exercise.dart';
import 'dart:convert';

// From JSON for a list of AssignedExercises
List<AssignedExercise> assignedExerciseListWithoutWorkoutFromJson(String jsonString) => List<AssignedExercise>.from(json.decode(jsonString).map((x) => AssignedExercise.fromJsonWithoutWorkout(x)));

// TO Json for a list of AssginedExercises
String assignedExercise assignedExerciseListToJson(List<AssignedExercise> assignedExerciseList) => json.encode(List<dynamic>.from(assignedExerciseList.map((x) => x.toJson()));

class AssignedExercise {

  static const String jsonId = 'ASSIGNED_EXERCISE_ID';
  static const String jsonWorkoutId = 'WORKOUT_ID';
  static const String jsonExerciseId = 'EXERCISE_ID';
  static const String jsonOrder = 'EXERCISE_ORDER';
  static const String jsonSets = 'ASSIGNED_SETS';
  static const String jsonReps = 'ASSIGNED_REPS';
  static const String jsonDuration = 'ASSIGNED_DURATION';
  static const String jsonDistance = 'ASSIGNED_DISTANCE';
  static const String jsonNotes = 'ASSIGNED_EXERCISE_NOTES';

  AssignedExercise({
    required this.id,
    required this.workoutId,
    required this.exercise,
    required this.order,
    this.sets,
    this.reps,
    this.duration,
    this.distance,
    this.notes,
  });

  int id;
  int workoutId;
  Exercise exercise;
  int order;
  int? sets;
  int? reps;
  String? duration;
  String? distance;
  String? notes;

  factory AssignedExercise.fromJsonWithoutWorkout(Map<String, dynamic> json) => AssignedExercise(
    id: json[jsonId],
    workoutId: json[jsonWorkoutId],
    exercise: Exercise.fromJson(json),
    order: json[jsonOrder],
    sets: json[jsonSets],
    reps: json[jsonReps],
    duration: json[jsonDuration],
    distance: json[jsonDistance],
    notes: json[jsonNotes],
  );

  Map<String, dynamic> toJson() => {
    jsonId: id,
    jsonWorkoutId: workoutId,
    jsonExerciseId: exercise.id,
    jsonOrder: order,
    jsonSets: sets,
    jsonReps: reps,
    jsonDuration: duration,
    jsonDistance: distance,
    jsonNotes: notes,
  };

}
