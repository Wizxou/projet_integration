import 'index.dart';

class User {
  String uid;
  User({this.uid = ""});
}

class UserData {
  final String uid;
  final String fname;
  final String lname;
  final String bio;
  final bool isEmployee;
  final List<Posting> postings;

  UserData(
    this.postings, {
    required this.uid,
    required this.fname,
    required this.lname,
    required this.bio,
    required this.isEmployee,
  });
}
