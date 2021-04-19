import 'package:flutter/material.dart';
import 'package:projet_integration/screens/ground.dart';

import 'package:projet_integration/screens/ground.dart';

class Service extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 100, left: 50, right: 50),
          color: Colors.lightBlueAccent,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                child: Icon(
                  Icons.grass_rounded,
                  color: Colors.white,
                  size: 200,
                ),
              ),
              SizedBox(
                height: 75,
                child: Center(
                  child: Text(
                    'What service are you interested ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Ground()),
                          ),
                          child: Text(
                            'Mowing the lawn',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                        ),
                        height: 50,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        child: ElevatedButton(
                          onPressed: null,
                          child: Text(
                            'Snow clearing',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                        ),
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
