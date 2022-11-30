
import 'package:cantrain/models/assigned_workout.dart';
import 'package:cantrain/services/api_service.dart';

class AssignedWorkoutApiService {

  Future<List<AssignedWorkout>?> getAssignedWorkoutListByAssignedRegiment(assignedRegimentId) async {
    var assignedWorkoutList;
    var url = ('/assignedWorkout/getListByAssignedRegiment/$assignedRegimentId');

    var response = await ApiService().get(url);

    if (response.statusCode == 200) {
      var json = response.body;

      assignedWorkoutList = assignedWorkoutListWithoutRegimentFromJson(json);
    }

    return assignedWorkoutList;
  }

  Future<AssignedWorkout> getAssignedWorkoutById(assignedWorkoutId) async {
    var assignedWorkout;
    var url = ('/assignedWorkout/findById/$assignedWorkoutId');

    var response = await ApiService().get(url);

    if (response.statusCode == 200) {
      var json = response.body;

      assignedWorkout = assignedWorkoutWithoutRegimentFromJson(json);
    }

    return assignedWorkout;
  }

}
