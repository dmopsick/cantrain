import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecordsView extends StatefulWidget {
  const RecordsView({super.key});

  @override
  State<RecordsView> createState() => _RecordsViewState();
}

class _RecordsViewState extends State<RecordsView> {
  // The authenticated user object from FireBase
  final authUser = FirebaseAuth.instance.currentUser!;
  bool isLoaded = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Visibility(
        // Show the UI after loading what we need from the DB
        visible: isLoaded,
        child: Scaffold (
          backgroundColor: Colors.blueGrey[200],
          body: Center(
            child: Column(
              children: const [
                SizedBox(height: 200),
                Text('Records Page yet to be implemented.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            )
          )
        )
      );
  }

}
