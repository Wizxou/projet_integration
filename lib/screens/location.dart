import 'package:flutter/material.dart';

import 'package:projet_integration/screens/recurrence.dart';

class Location extends StatelessWidget {
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
                  Icons.location_history,
                  color: Colors.white,
                  size: 200,
                ),
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Where are you located',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  cursorColor: Colors.white,
                  /*
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  */
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 650,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Recurrence()),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
