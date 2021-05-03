import 'index.dart';
class UserData {
  final String uid;
  final String username;
  final String bio;
  final String email;
  final bool isEmployee;
  final List<dynamic> postings;

  UserData({
    required this.postings,
    required this.uid,
    required this.username,
    required this.email,
    required this.bio,
    required this.isEmployee,
  });
}
