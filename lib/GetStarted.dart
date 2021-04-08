import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {

  final String data; 

  GetStarted(this.data);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      child: Column(
        children: [
          SizedBox(
            child: Text('Where are you located'),
          ),
        ],
      ),
    ));
  }
}
