import 'package:cantrain/models/assigned_exercise.dart';
import 'package:cantrain/services/assigned_exercise_api_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return 
       Scaffold(
          appBar: AppBar(
            title: Text('${assignedExercise?.exercise.name}',
              style: GoogleFonts.bebasNeue(),
            ),
          ),
          backgroundColor: Colors.blueGrey[200],
          body: Visibility(
            visible: isLoaded,
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Exercise Name',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
          
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Center(child: Text(
                                  '${assignedExercise?.exercise.name}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  )
                                  ),
                              ),
                            ),
                          ),
                        ),
          
                        const SizedBox(height: 20),
          
                        Text('Exercise Instructions',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
          
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Center(child: Text(
                                  '${assignedExercise?.exercise.instructions}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  )
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 20),
          
                        Text('Assinged Notes',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Center(child: Text(
                                  '${assignedExercise?.notes}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  )
                                  ),
                              ),
                              ),
                            ),
                          ),
          
                          const SizedBox(height: 20),
          
                          Text('Assigned Sets',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Center(child: Text(
                                    '${assignedExercise?.sets}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    )
                                    ),
                                ),
                                ),
                              ),
                            ),
          
                            const SizedBox(height: 20),
          
                            Text('Assigned Reps',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Center(child: Text(
                                      '${assignedExercise?.reps}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      )
                                      ),
                                  ),
                                  ),
                                ),
                              ),
                      ]),
                ),
              ),
            ),
          ),
      
      );
  }

}
