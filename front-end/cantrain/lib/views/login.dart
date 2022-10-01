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
            body: SafeArea(
              child: Center(
                child: Column(
                  children : const [
                    // CanTrain header
                    Text('CanTrain'),
            
                    // Flavor text
                    Text('Empowering and connecting trainers and their clients')
            
                    // Email input
            
                    // Password input
            
                    // Log in button
            
                    // New user register
                ]),
              ),
            ),

        );
    }

}
