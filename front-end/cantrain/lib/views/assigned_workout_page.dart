
class AssignedWorkoutView extends StatefulWidget {
  const AssignedWorkoutView({Key? key, this.assignedWorkoutId})
    : super (key: key);

    final int? assignedWorkoutId;

    @override
    State<AssignedWorkoutView> createState() => _AssignedWorkoutView(assignedWorkoutId);
}

class _AssignedWorkoutView extends State<AssignedWorkoutView> {
  bool isLoaded = false;
  int ?assignedWorkoutId;
  AssignedWorkout? assignedWorkout;
  List<AssignedExercise>? assignedExerciseList;


}
