import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cantrain/services/api_service.dart';
import '../models/dbuser.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  // The authenticated user object from FireBase
  final authUser = FirebaseAuth.instance.currentUser!;
  DBUser? currentUser;
  bool isLoaded = false;

  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _preferredNameController = TextEditingController();

  @override
  void initState() {
    super.initState();

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
        _emailController.text = currentUser!.email;
        _firstNameController.text = currentUser!.firstName;
        _lastNameController.text = currentUser!.lastName;

        if (currentUser!.preferredName != null) {
          _preferredNameController.text = currentUser!.preferredName as String;
        }

        isLoaded = true;
      });
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        // Show the UI after loading what we need from the DB
        visible: isLoaded,
        child: Scaffold(
          backgroundColor: Colors.blueGrey[200],
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 75),

                      const Text('Email: '),

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
                            child: TextField(
                              enabled: false,
                              controller: _emailController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none, hintText: 'Email'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Text('First Name: '),

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
                            child: TextField(
                              enabled: false,
                              controller: _firstNameController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'First Name'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      const Text('Last Name: '),

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
                            child: TextField(
                              enabled: false,
                              controller: _lastNameController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Last Name'),
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      const Text('Preferred Name: '),
                      
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
                            child: TextField(
                              enabled: false,
                              controller: _preferredNameController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Preferred Name'),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                
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

                    ]),
              ),
            ),
          ),
        ));
  }
}
