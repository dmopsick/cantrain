import 'package:cantrain/models/assigned_regiment.dart';
import 'package:cantrain/models/assigned_workout.dart';
import 'package:cantrain/services/assigned_regiment_api_service.dart';
import 'package:cantrain/services/assigned_workout_api_service.dart';
import 'package:cantrain/views/assigned_workout_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssignedRegimentView extends StatefulWidget {
  const AssignedRegimentView({Key? key, this.assignedRegimentId})
      : super(key: key);

  final int? assignedRegimentId;

  @override
  State<AssignedRegimentView> createState() => _AssignedRegimentView(assignedRegimentId);
}

class _AssignedRegimentView extends State<AssignedRegimentView> {
  bool isLoaded = false;
  int? assignedRegimentId;
  AssignedRegiment? assignedRegiment;
  List<AssignedWorkout>? assignedWorkoutList;

  // Constructor to take assignedRegimentId
  _AssignedRegimentView(int? this.assignedRegimentId);

  @override
  void initState() {
    super.initState();
    
    loadFromDB(assignedRegimentId);
  }

  openAssignedWorkout(BuildContext context, assignedWorkoutId) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return AssignedWorkoutView(assignedWorkoutId: assignedWorkoutId);
    }));
  }

  loadFromDB(assignedRegimentId) async {
    assignedRegiment = await AssignedRegimentApiService().getAssignedRegimentById(assignedRegimentId);

    if (assignedRegiment != null) {

      assignedWorkoutList = await AssignedWorkoutApiService().getAssignedWorkoutListByAssignedRegiment(assignedRegimentId);

      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${assignedRegiment?.regiment.name}',
          style: GoogleFonts.bebasNeue(),
        ),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: assignedWorkoutList?.length,
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
                        openAssignedWorkout(context, assignedWorkoutList![index].id);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              assignedWorkoutList![index].workout.name,
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
                              assignedWorkoutList![index].workout.workoutDescription ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              // style: GoogleFonts.bebasNeue(),
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
