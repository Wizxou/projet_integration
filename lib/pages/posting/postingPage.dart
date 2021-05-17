import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helpy/models/posting.dart';
import 'package:helpy/models/user.dart';
import 'package:helpy/pages/editPosting/editPostingPage.dart';
import 'package:helpy/providers/authenticationProvider.dart';
import 'package:helpy/services/database.dart';
import 'package:provider/provider.dart';
part 'postingPage.g.dart';

@hwidget
Widget postingPage(Posting posting) {
  final context = useContext();
  final user = Provider.of<User?>(context);
  final Color primaryColor = Colors.green;
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  Widget _buildButtons() {
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
              if (posting.employeeUID == user.uid) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text("Not Interested Anymore"),
                      onPressed: () async {
                          await DatabaseService().updatePostingEmployee(
                                    postingUID: posting.uid,
                                    employeeUID: '');
                                Navigator.pop(context);
                      },
                    ),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text("Interested"),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(
                            'Are you sure you want to take this posting?',
                          ),
                          content: Text(
                              'You have to contact the author of this posting for more information'),
                          actions: [
                            FlatButton(
                              onPressed: () async {
                                await DatabaseService().updatePostingEmployee(
                                    postingUID: posting.uid,
                                    employeeUID: user.uid);
                                Navigator.of(context, rootNavigator: true)
                                    .pop('dialog');
                                Navigator.pop(context);
                              },
                              child: Text('Yes'),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop('dialog');
                              },
                              child: Text('No'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            }

            if (user.uid == '${posting.creatorUID}') {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            color: Colors.grey,
                            textColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text("Edit your posting"),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditPostingPage(posting)));
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            color: Colors.red,
                            textColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text("Delete your posting"),
                            onPressed: () async {
                              await DatabaseService()
                                  .removePosting(posting.uid);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }
          }
          return SizedBox();
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      posting.image,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  right: 20.0,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        posting.category == PostingCategory.LawnMowing
                            ? Icons.grass
                            : FontAwesomeIcons.snowflake,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        posting.category.toString().substring(16),
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Posting"),
                      ),
                      Icon(Icons.article),
                    ],
                  ),
                  Text(
                    posting.title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    posting.address,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    posting.phone,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    posting.area.toString(),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    posting.description,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildButtons()
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
