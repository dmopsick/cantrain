import 'package:flutter/material.dart';

class ExistingUserLoginView extends StatelessWidget {
    ExistingUserLoginView({super.key, required this.title});

    final String title;

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Text(title)
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text('Existing User login page'),
                    ],
                ),
            ),

        );

    }

}
