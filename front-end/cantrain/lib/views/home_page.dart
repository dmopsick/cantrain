import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cantrain/models/dbuser.dart';
import 'package:cantrain/services/api_service.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
            
            bottomNavigationBar: Container(
              color: Colors.blue.shade900,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: GNav(
                  gap: 8,
                  backgroundColor: Colors.blue.shade900,
                  color: Colors.white,
                  activeColor: Colors.white,
                  tabBackgroundColor: Colors.blue.shade800,
                  padding: EdgeInsets.all(16),
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'Home'
                    ),
                    GButton(
                      icon: Icons.library_books,
                      text: 'Records'
                    ),
                    GButton(
                      icon: Icons.account_circle,
                      text: 'Account'
                    ),   
                  ]
                ),
              ),
            ),

        ),
      );
  
  }
}
