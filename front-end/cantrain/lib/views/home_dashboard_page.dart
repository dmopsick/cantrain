import 'package:cantrain/models/assigned_regiment.dart';
import 'package:cantrain/models/trainer.dart';
import 'package:cantrain/services/assigned_regiment_api_service.dart';
import 'package:cantrain/views/assigned_regiment_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cantrain/models/dbuser.dart';
import 'package:cantrain/services/api_service.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDashboardView extends StatefulWidget {
  const HomeDashboardView({super.key});

  @override
  State<HomeDashboardView> createState() => _HomeDashboardViewState();
}

class _HomeDashboardViewState extends State<HomeDashboardView> {
  // The authenticated user object from FireBase
  final authUser = FirebaseAuth.instance.currentUser!;
  bool isLoaded = false;
  // The current user's info from the DB
  DBUser? currentUser;
  Trainer? trainer;
  List<AssignedRegiment>? assignedRegimentList;

  @override
  void initState() {
    super.initState();

    loadFromDB(authUser.email);
  }

  // Function to open up selected Assigned Regiment
  openAssignedRegiment(BuildContext context, assignedRegimentId) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return AssignedRegimentView(assignedRegimentId : assignedRegimentId);
    }));
  }

  // I will need to call this function from every file
  // Will need to house it somewhere else and import it or something
  loadFromDB(email) async {
    // Load the user from the API
    currentUser = await ApiService().getUserByEmail(email);

    // If the user is loaded, load the UI
    if (currentUser != null) {
      // Load the assigned regiments for the currentUser
      assignedRegimentList = await AssignedRegimentApiService().getAssignedRegimentListByUser(currentUser?.id);

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
          'Assigned Regiments',
           style: GoogleFonts.bebasNeue(),
          ),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: assignedRegimentList?.length,
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
                    child: const Icon(
                        Icons.fitness_center,
                        size: 50
                      ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        openAssignedRegiment(context, assignedRegimentList![index].id);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            assignedRegimentList![index].regiment.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Trainer: ${assignedRegimentList![index].regiment.trainer} ${assignedRegimentList![index].regiment.trainer.user.lastName}' ?? '',
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
