import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'screens/first_screen.dart';
import 'screens/location.dart';

void main() => runApp(MyApp()); // Fonction that does one thing

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Firstscreen(),
       debugShowCheckedModeBanner: false,
    );
  }
}
