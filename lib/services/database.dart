import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpy/models/posting.dart';
import 'package:helpy/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ required this.uid});

  // collection reference
  final CollectionReference postingCollection =
      FirebaseFirestore.instance.collection('postings');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await postingCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // posting list from snapshot
  List<Posting> _postingListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Posting(
          title: doc['${title}'] ?? '',
          description: '',
          cost: doc.cost,
          image: '');
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(uid: uid, name: snapshot.data['name'], postings: ['']);
  }

  // get postings stream
  Stream<List<Posting>> get postings {
    return postingCollection.snapshots().map(_postingListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return postingCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
