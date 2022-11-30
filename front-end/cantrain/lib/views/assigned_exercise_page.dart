import 'package:cantrain/models/assigned_exercise.dart';
import 'package:cantrain/services/assigned_exercise_api_service.dart';
import 'package:flutter/material.dart';

class AssignedExerciseView extends StatefulWidget {
  const AssignedExerciseView({Key? key, this.assignedExerciseId}) 
  : super (key : key);

  final int? assignedExerciseId;

  @override
  State<AssignedExerciseView> createState() => _AssignedExerciseViewState(assignedExerciseId);
}

class _AssignedExerciseViewState extends State<AssignedExerciseView> {
  bool isLoaded = false;
  AssignedExercise? assignedExercise;
  int? assignedExerciseId;

  _AssignedExerciseViewState(int? this.assignedExerciseId);

  // final _exerciseNameController = 

  @override
  void initState() {
    super.initState();

    loadData(assignedExerciseId);
  }

  loadData(assignedExerciseId) async {
    assignedExercise = await AssignedExerciseApiService().getAssignedExerciseById(assignedExerciseId);

    if (assignedExercise != null) {
      
      setState(() {
        isLoaded = true;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        // Show the UI after loading what we need from the DB
        visible: isLoaded,
        child: Scaffold(
          appBar: AppBar(
            title: Text(assignedExercise!.exercise.name),
          ),
          backgroundColor: Colors.blueGrey[200],
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 75),

                      Text('Exercise Name: ${assignedExercise!.exercise.name}'),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Text('${assignedExercise!.exercise.name}'),
                            ),
                          ),
                        ),
                      
                      const SizedBox(height: 20),

                      
            
                    ]),
              ),
            ),
          ),
        )
      );
  }

}


