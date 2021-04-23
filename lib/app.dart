import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helpy/pages/index.dart';
import 'package:firebase_core/firebase_core.dart';
part 'app.g.dart';

@hwidget
Widget app() {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Text('An error occured'),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return AuthPage();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text('Loading...');
      },
    ),
  );
}
