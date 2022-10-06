import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
    const LoginView({super.key});

    @override
    State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

    final _emailController = TextEditingController();

    final _passwordController = TextEditingController();

    Future signIn() async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(), 
        password: _passwordController.text.trim(),
      );
    }

    @override
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            backgroundColor: Colors.blueGrey[200],
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
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
                          child: Padding(
                            padding:  const EdgeInsets.only(left: 25),
                            child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
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
                          child: Padding(
                            padding:  const EdgeInsets.only(left: 25),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
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
                        child: GestureDetector(
                          onTap: signIn,
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
            ),

        );
    }

}
