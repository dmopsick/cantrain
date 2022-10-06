import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed in as ' + user.email!),
            MaterialButton (
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.indigo[700],
              child: Text(
                'Sign Out',
                style : TextStyle (color: Colors.white),
              ),
            )
          ],
        ),
        ),
    );
  }
}