import 'package:cantrain/models/trainer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cantrain/models/dbuser.dart';
import 'package:cantrain/services/api_service.dart';

import '../models/client.dart';

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
  Client? client;
  Trainer? trainer;
  List<AssignedRegiment> assignedRegimentList;

  @override
  void initState() {
    super.initState();
    
    // Load the user record
    loadUser(authUser.email);

    if (currentUser != null) {
      // Attempt to load a trainer record
      // loadTrainer()

      // Attempt to load a client record
      loadClient();

      if (client != null) {

      }
    }

  }

  // I will need to call this function from every file
  // Will need to house it somewhere else and import it or something
  loadUser(email) async {
    // Load the user from the API
    currentUser = await ApiService().getUserByEmail(email);

    // If the user is loaded, load the UI
    if (currentUser != null) {
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
                Text('Signed in as ${currentUser?.email}. Hello ${currentUser?.firstName} ${currentUser?.lastName}'),
                MaterialButton (
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  color: Colors.indigo[700],
                  child: const Text(
                    'Sign Out',
                    style : TextStyle (color: Colors.white),
                  ),
                )
              ],
            ),
            ),
      
        ),
      );
    
    }

  }