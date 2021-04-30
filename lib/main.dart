import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helpy/app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}
