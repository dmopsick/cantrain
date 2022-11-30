import 'package:cantrain/models/assigned_exercise.dart';
import 'package:cantrain/services/api_service.dart';

class AssignedExerciseApiService {

  Future<List<AssignedExercise>?> getAssignedExerciseListByAssignedWorkout(assignedWorkoutId) async {
    var assignedExerciseList;
    var url = ('/assignedExercise/getListByAssignedWorkout/$assignedWorkoutId');

    var response = await ApiService().get(url);

    if (response.statusCode == 200) {
      var json = response.body;

      assignedExerciseList = assignedExerciseListWithoutWorkoutFromJson(json);
    }

    return assignedExerciseList;
  }

  Future<AssignedExercise> getAssignedExerciseById(assignedExerciseId) async {
    var assignedExercise;
    var url = ('/assignedExercise/findById/$assignedExerciseId');

    var response = await ApiService().get(url);

    if (response.statusCode == 200) {
      var json = response.body;

      assignedExercise = assignedExerciseWithoutWorkoutFromJson(json);
    }


    return assignedExercise;
  }

}
