import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helpy/providers/authenticationProvider.dart';
import 'package:provider/provider.dart';
part 'loginForm.g.dart';

@hwidget
Widget loginForm() {
  final context = useContext();
  final _email = useTextEditingController();
  final _emailListenable = useValueListenable(_email);
  final _password = useTextEditingController();
  final _passwordListenable = useValueListenable(_password);
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
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Enter email",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        TextField(
          controller: _password,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Enter password",
            border: OutlineInputBorder(),
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
          child: Text("Login"),
          onPressed: () {
            print(_emailListenable.text);
            print(_passwordListenable.text);
            context.read<AuthenticationProvider>().signIn(
                  _emailListenable.text.trim(),
                  _passwordListenable.text.trim(),
                );
          },
        ),
      ],
    ),
  );
}
