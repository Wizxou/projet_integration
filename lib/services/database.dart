import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpy/models/posting.dart';
import 'package:helpy/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference postingCollection =
      FirebaseFirestore.instance.collection('postings');

  Future<void> updatePosting(String title, String description, String price,
      String image, String category) async {
    return await postingCollection.doc(uid).set({
      'title': title,
      'description': description,
      'price': price,
      'image': image,
      'category': category
    });
  }

  Future<DocumentReference?> addPosting(String title, String description,
      String price, String image, String category) async {
    return await postingCollection.add({
      'title': title,
      'description': description,
      'price': price,
      'image': image,
      'category': category
    });
  }

  Future<void> removePosting(String uid) async {
    return await postingCollection.doc(uid).delete();
  }

  // posting list from snapshot
  List<Posting> _postingListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Posting(
          title: doc['title'],
          description: doc['title'],
          price: doc['price'],
          image: doc['title'],
          creatorUID: doc['creatorUID'],
          employeeUID: doc['employeeUID'],
          category: doc['category']);
    }).toList();
  }

  // get postings stream
  Stream<List<Posting>> get postings {
    return postingCollection.snapshots().map(_postingListFromSnapshot);
  }
}
