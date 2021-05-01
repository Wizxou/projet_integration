import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helpy/providers/authenticationProvider.dart';
import 'package:provider/provider.dart';
part 'signUpForm.g.dart';

@hwidget
Widget signUpForm() {
  final _email = useTextEditingController();
  final _emailListenable = useValueListenable(_email);
  final _password = useTextEditingController();
  final _passwordListenable = useValueListenable(_password);
  final _passwordConfirmation = useTextEditingController();
  final _passwordConfirmationListenable =
      useValueListenable(_passwordConfirmation);

  final isEmployee = useState(false);
  final context = useContext();

  useValueListenable(_passwordConfirmation);
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
        TextField(
          controller: _passwordConfirmation,
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
                value: isEmployee.value,
                onChanged: (value) {
                  isEmployee.value = value;
                },
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
          child: Text("Sign Upx"),
          onPressed: () {
            context.read<AuthenticationProvider>().signUp(
                _emailListenable.text.trim(), _passwordListenable.text.trim(),
                isEmployee: isEmployee.value);
          },
        ),
      ],
    ),
  );
}
