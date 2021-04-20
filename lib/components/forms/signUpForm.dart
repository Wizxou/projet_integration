import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
part 'signUpForm.g.dart';

@hwidget
Widget signUpForm() {
  return Container(
    margin: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            hintText: "Enter email",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Enter password",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Confirm password",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        Center(
          child: Row(
            children: [
              Text('Employee'),
              Switch(
                value: true,
                onChanged: (value) {},
                activeColor: Colors.green,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        RaisedButton(
          color: Colors.green,
          textColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text("Sign Up"),
          onPressed: () {},
        ),
      ],
    ),
  );
}
