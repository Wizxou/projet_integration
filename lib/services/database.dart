import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpy/models/posting.dart';
import 'package:helpy/models/user.dart';

class DatabaseService {
  // collection reference
  final CollectionReference<Map<String, dynamic>> postingCollection =
      FirebaseFirestore.instance.collection('postings');

  void readData() {
    postingCollection
        .get()
        .then((qs) => qs.docs.forEach((result) => print(result.data())));
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

  Future<void> updatePosting(String title, String description, String price,
      String image, String category, String uid) async {
    return await postingCollection.doc(uid).update({
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
  Stream<QuerySnapshot<Map<String, dynamic>>> get postings {
    return postingCollection.snapshots();
  }
}
