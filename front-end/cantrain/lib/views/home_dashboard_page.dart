import 'package:cantrain/models/assigned_regiment.dart';
import 'package:cantrain/models/trainer.dart';
import 'package:cantrain/services/assigned_regiment_api_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cantrain/models/dbuser.dart';
import 'package:cantrain/services/api_service.dart';


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

    // Load the user record
    loadFromDB(authUser.email);
  }

  // I will need to call this function from every file
  // Will need to house it somewhere else and import it or something
  loadFromDB(email) async {
    // Load the user from the API
    currentUser = await ApiService().getUserByEmail(email);

    // If the user is loaded, load the UI
    if (currentUser != null) {
      // Load the assigned regiments for the currentUser 
      assignedRegimentList = await AssignedRegimentApiService().getAssignedRegimentListByUser(currentUser);

      print('Flag 1 ${assignedRegimentList![0].id}');
      print('Flag 2 ${assignedRegimentList![0].regiment.name}');

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
        child: Scaffold (
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Center(child: Text('Hello ${currentUser?.firstName}')),
                // ListView.builder(
                //   itemCount: assignedRegimentList?.length,
                //   itemBuilder: (context, index) {
                //     return Center(
                //       child: Text('Hello')
                //     );
                //   }
                // )
              ],
            ),
            ),
      
        ),
      );
    
    }

  }