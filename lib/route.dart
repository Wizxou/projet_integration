import 'package:flutter/material.dart';
import 'package:projet_integration/GetStarted.dart';

import 'GetStarted.dart';

class Rout {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'GetStarted':
        return MaterialPageRoute(builder: (_) => GetStarted('GetStarted'));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
  }
