import 'index.dart';

class User {
  String uid;
  User({this.uid = ""});
}

class UserData {
  final String uid;
  final String username;
  final String bio;
  final String email;
  final bool isEmployee;
  final List<Posting> postings;

  UserData(
    this.postings, {
    required this.uid,
    required this.username,
    required this.email,
    required this.bio,
    required this.isEmployee,
  });
}
