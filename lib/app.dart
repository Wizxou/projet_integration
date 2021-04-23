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
    routes: {
      '/home': (context) => HomePage(),
      '/auth': (context) => AuthPage(),
    },
    home: FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('An error occured'),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return AuthWrapper();
        }
        return Text('Loading...');
      },
    ),
  );
}

@hwidget
Widget authWrapper() {
  final user = 'hello world';
  print('from wrapper widget: $user');
  if (user == null) {
    return AuthPage();
  } else {
    return HomePage();
  }
}
