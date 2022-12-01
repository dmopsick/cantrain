import 'package:cantrain/services/assigned_exercise_api_service.dart';
import 'package:cantrain/services/assigned_workout_api_service.dart';
import 'package:cantrain/views/assigned_exercise_page.dart';
import 'package:flutter/material.dart';
import 'package:cantrain/models/assigned_exercise.dart';
import 'package:cantrain/models/assigned_workout.dart';
import 'package:google_fonts/google_fonts.dart';

class AssignedWorkoutView extends StatefulWidget {
  const AssignedWorkoutView({Key? key, this.assignedWorkoutId})
    : super (key: key);

    final int? assignedWorkoutId;

    @override
    State<AssignedWorkoutView> createState() => _AssignedWorkoutViewState(assignedWorkoutId);
}

class _AssignedWorkoutViewState extends State<AssignedWorkoutView> {
  bool isLoaded = false;
  int? assignedWorkoutId;
  AssignedWorkout? assignedWorkout;
  List<AssignedExercise>? assignedExerciseList;

  // Constructor taking in the AssigendWorkoutId
  _AssignedWorkoutViewState(int? this.assignedWorkoutId);

  @override
  void initState() {
    super.initState();

    loadFromDB(assignedWorkoutId);
  }

  openAssignedExercise(BuildContext context, assignedExerciseId) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return AssignedExerciseView(assignedExerciseId: assignedExerciseId);
    }));
  }

  loadFromDB(assignedWorkoutId) async {
    assignedWorkout = await AssignedWorkoutApiService().getAssignedWorkoutById(assignedWorkoutId);

    if (assignedWorkout != null) {
      assignedExerciseList = await AssignedExerciseApiService().getAssignedExerciseListByAssignedWorkout(assignedWorkoutId);

      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext  context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text(
          '${assignedWorkout?.workout.name}',
          style: GoogleFonts.bebasNeue(),
        ),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: assignedExerciseList?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                    child: const Icon(Icons.fitness_center, size: 50),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        openAssignedExercise(context, assignedExerciseList![index].exercise.id);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              assignedExerciseList![index].exercise.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              assignedExerciseList![index].exercise.instructions ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ); 
  }

}
