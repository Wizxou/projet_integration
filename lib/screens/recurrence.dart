import 'package:flutter/material.dart';

class Recurrence extends StatelessWidget {
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
                Icons.calendar_today,
                color: Colors.white,
                size: 200,
              )),
              SizedBox(
                height: 75,
                child: Center(
                  child: Text(
                    'One time or Recurrence ?',
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
                          onPressed: null,
                          child: Text(
                            'One time',
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
                            'Recurrence',
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

class OneTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Enter your email',
        ),
        cursorColor: Colors.white,
      ),
    );
  }
}
