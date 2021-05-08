import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helpy/models/index.dart';
import 'package:helpy/providers/authenticationProvider.dart';
import 'package:helpy/services/database.dart';
import 'package:provider/provider.dart';
part 'profilePage.g.dart';

@hwidget
Widget profilePage() {
  final context = useContext();
  final user = Provider.of<User?>(context);
  return FutureBuilder(
      future: DatabaseService().getUserData(user!.uid),
      builder: (context, AsyncSnapshot<UserData?> snapshot) {
        print(snapshot);
        if (!snapshot.hasData) {
          return Center(child: Text('Loading'));
        }
        if (snapshot.data != null) {
          final snapData = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: snapData!.isEmployee
                              ? 'You are an employee'
                              : 'You are a customer',
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: snapData.email,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      MaterialButton(
                        child: Text("Sign Out"),
                        color: Colors.grey,
                        onPressed: () {
                          context.read<AuthenticationProvider>().signOut();
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Text('hello');
      });
}
