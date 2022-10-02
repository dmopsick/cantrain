import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
    const LoginView({super.key});

    @override
    State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            backgroundColor: Colors.blueGrey[300],
            body: SafeArea(
              child: Center(
                child: Column(
                  children : [
                    const SizedBox(height: 50),
                    const Text(
                      'CanTrain',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
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
            
                    const SizedBox(height: 20),

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
                              color: Colors.white
                            )
                          ),
                      ),
                        ),
                    ),
            
                    // New user register
                ]),
              ),
            ),

        );
    }

}
