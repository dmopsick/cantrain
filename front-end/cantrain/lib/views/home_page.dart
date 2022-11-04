import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cantrain/models/dbuser.dart';
import 'package:cantrain/services/api_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // The authenticated user object from FireBase
  final authUser = FirebaseAuth.instance.currentUser!;
  // The current user's info from the DB
  DBUser? currentUser;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

      // Load the current user's info from the DB
     loadUser(authUser.email);
  }

  // I will need to call this function from every file
  // Will need to house it somewhere else and import it or something
  loadUser(email) async {
    // DBUser? user;

    // Load the user from the API
    currentUser = await ApiService().getUserByEmail(email);

    if (currentUser != null) {
      setState(() {
        isLoaded = true;
      });
    }

    // return user;
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