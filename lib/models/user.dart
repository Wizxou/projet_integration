class User {
  final String uid;
  User({ required this.uid });
}

class UserData {
  final String uid;
  final String name;
  final String postings;
  UserData({ required this.uid, required this.postings, required this.name });
}