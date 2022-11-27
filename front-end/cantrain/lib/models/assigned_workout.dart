import 'package:cantrain/models/workout.dart';
import 'dart:convert';

// From JSON for a list of assigned workouts
List<AssignedWorkout> assignedWorkoutListWithoutRegimentFromJson(String jsonString) => List<AssignedWorkout>.from(json.decode(jsonString).map((x) => AssignedWorkout.fromJsonWithoutRegiment(x)));

// From JSON for a single assignedWorkout

class AssignedWorkout {

  static const String jsonId = 'ASSIGNED_WORKOUT_ID';
  static const String jsonRegimentId = 'REGIMENT_ID';
  static const String jsonWorkoutId = 'WORKOUT_ID';
  static const String jsonWorkoutOrder = 'WORKOUT_ORDER';
  static const String jsonAssignedWorkoutNotes = 'ASSIGNED_WORKOUT_NOTES';

  AssignedWorkout({
    required this.id,
    required this.regimentId,
    required this.workout,
    required this.workoutOrder,
    this.assignedWorkoutNotes
  });

  int id;
  int regimentId;
  Workout workout;
  int workoutOrder;
  String? assignedWorkoutNotes;

  factory AssignedWorkout.fromJsonWithoutRegiment(Map<String, dynamic> json) => AssignedWorkout(
    id: json[jsonId],
    regimentId: json[jsonRegimentId],
    workout: Workout.fromJson(json),
    workoutOrder: json[jsonWorkoutOrder],
    assignedWorkoutNotes: json[jsonAssignedWorkoutNotes],
  );

  Map<String, dynamic> toJson() => {
    jsonId: id,
    jsonRegimentId: regimentId,
    jsonWorkoutId: workout.id,
    jsonWorkoutOrder: workoutOrder,
    jsonAssignedWorkoutNotes: assignedWorkoutNotes,
  };

}