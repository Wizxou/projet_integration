import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helpy/pages/home.dart';
part 'app.g.dart';

@hwidget
Widget app() {
  return MaterialApp(debugShowCheckedModeBanner: false, home: const Home());
}
