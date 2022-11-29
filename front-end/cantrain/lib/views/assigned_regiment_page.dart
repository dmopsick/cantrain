import 'package:cantrain/models/assigned_regiment.dart';
import 'package:cantrain/models/assigned_workout.dart';
import 'package:cantrain/services/assigned_regiment_api_service.dart';
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

  // Constructor to take in specified int for AssignedRegiment
  _AssignedRegimentView(int? this.assignedRegimentId);

  @override
  void initState() {
    super.initState();

    print("Flag 15: $assignedRegimentId");
    
    loadFromDB(assignedRegimentId);
  }

  loadFromDB(assignedRegimentId) async {
    assignedRegiment = await AssignedRegimentApiService().getAssignedRegimentById(assignedRegimentId);

    if (assignedRegiment != null) {
      print("Time to go ahead and load the assigned workout list");

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
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print("Flag 1");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            assignedWorkoutList![index].workout.workoutName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Bottom Text' ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.bebasNeue(),
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
