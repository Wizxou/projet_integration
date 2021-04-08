import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './GetStarted.dart';
import './route.dart';

const String GetStartedroute = '/GetStarted';

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
        onGenerateRoute: Rout.generateRoute,
        debugShowCheckedModeBanner: false,
        home: Container(
          color: Colors.lightBlueAccent,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 650,
                height: 50,
                child: ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                width: 650,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    //Navigator.push(
                    //  context,
                    //  MaterialPageRoute(builder: (context) => GetStarted()),
                    //);
                    //Navigator.pushNamed(context, GetStartedroute);
                    Navigator.of(context).pushNamed(GetStartedroute);
                  },
                  //*** Rajouter un peu d'espace en bas ***//
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.lightBlueAccent)),
                  child: Text(
                    'Already have an account? Log in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}


