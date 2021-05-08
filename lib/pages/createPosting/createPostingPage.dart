import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helpy/components/index.dart';
import 'package:helpy/models/user.dart';
import 'package:helpy/services/database.dart';
import 'package:provider/provider.dart';
part 'createPostingPage.g.dart';

@hwidget
Widget createPostingPage() {
  final Color primaryColor = Colors.green;
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);
  final context = useContext();
  final user = Provider.of<User?>(context);

  Widget _buildBody() {
    return FutureBuilder(
        future: DatabaseService().getUserData(user!.uid),
        builder: (context, AsyncSnapshot<UserData?> snapshot) {
          print(snapshot);
          if (!snapshot.hasData) {
            return Center(child: Text('Loading'));
          }
          if (snapshot.data != null) {
            final snapData = snapshot.data;
            if (snapData!.isEmployee == true) {
              return Center(
                child: Text('You are an employee! You cannot create postings.'),
              );
            } else {
              return CreatePostingForm();
            }
          }
          return Text('hello');
        });
  }

  return Theme(
    data: ThemeData(
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        textTheme: TextTheme(
          title: TextStyle(
            color: secondaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: secondaryColor),
        actionsIconTheme: IconThemeData(
          color: secondaryColor,
        ),
      ),
    ),
    child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create a Posting'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.snowflake,
              size: 20,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: _buildBody(),
    ),
  );
}
