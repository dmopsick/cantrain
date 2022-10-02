import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
    const LoginView({super.key});

    @override
    State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            backgroundColor: Colors.blueGrey[200],
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children : [
                    const Icon(
                      Icons.fitness_center,
                      size: 100
                    ),
                    
                    const SizedBox(height: 75),
                    
                    Text(
                      'CanTrain',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 48
                      ),
                    ),
            
                    const SizedBox(height: 10),

                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Empowering trainers and connecting them to their clients',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
            
                    const SizedBox(height: 20),

                    // Email input
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding:  EdgeInsets.only(left: 25),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email'
                            ),
                          ),
                        ),
                      ),
                    ),
            
                    const SizedBox(height: 10),

                    // Password input
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding:  EdgeInsets.only(left: 25),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password'
                            ),
                          ),
                        ),
                      ),
                    ), 

                    const SizedBox(height: 20),

                    // Log in button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text('Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )
                          ),
                      ),
                        ),
                    ),
            
                  const SizedBox(height: 20),

                  // New user register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Create Client Account ',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' Create Trainer Account',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),


                ]),
              ),
            ),

        );
    }

}
