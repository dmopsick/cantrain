import 'package:flutter/material.dart';

class NewUserLoginView extends StatelessWidget {
    NewUserLoginView({super.key, required this.title});

    final String title;

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Text(title),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text('New User login page')
                    ],
                ),
            ),
     
        );

    }

}
