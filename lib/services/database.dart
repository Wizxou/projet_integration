import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpy/models/posting.dart';
import 'package:helpy/models/user.dart';
import 'package:uuid/uuid.dart';
// import 'package:username_gen/username_gen.dart';

class DatabaseService {
  // collection reference
  final CollectionReference<Map<String, dynamic>> postingCollection =
      FirebaseFirestore.instance.collection('postings');
  final CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection('users');

  void readData() {
    postingCollection
        .get()
        .then((qs) => qs.docs.forEach((result) => print(result.data())));
  }

  // Future<DocumentReference?> addPosting(
  //     {required String title,
  //     required String description,
  //     required double price,
  //     required String image,
  //     required String category,
  //     required String uid}) async {
  //   return await postingCollection.add({
  //     'title': title,
  //     'description': description,
  //     'price': price,
  //     'image': image,
  //     'category': category,
  //     'employeeUID': '',
  //     'creatorUID': uid
  //   });
  // }

  Future<void> addPosting(
      {required String title,
      required String description,
      required double price,
      required String image,
      required String category,
      required double area,
      required String address,
      required String phone,
      required String creatorUID}) async {
    var uuid = Uuid();
    final docId = uuid.v4();
    await postingCollection.doc(docId).set({
      'uid': docId,
      'title': title,
      'description': description,
      'price': price,
      'image': image,
      'category': category,
      'employeeUID': '',
      'creatorUID': creatorUID,
      'phone': phone,
      'area': area,
      'address': address
    });
  }

  Future<void> updatePostingEmployee({
    required String postingUID,
    required String employeeUID,
  }) async {
    print('In update posting employee $postingUID');
    return await postingCollection.doc(postingUID).update({
      'employeeUID': employeeUID,
    });
  }

  Future<void> updatePosting({
    required String postingUID,
    required String title,
    required String description,
    required double price,
    required String image,
    required String category,
    required double area,
    required String address,
    required String phone,
  }) async {
    print('In update posting $postingUID');
    return await postingCollection.doc(postingUID).update({
      'title': title,
      'description': description,
      'price': price,
      'image': image,
      'category': category,
    });
  }

  Future<void> removePosting(String uid) async {
    return await postingCollection.doc(uid).delete();
  }

  // posting list from snapshot
  List<Posting> _postingListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Posting(
          uid: doc['uid'],
          title: doc['title'],
          description: doc['title'],
          price: doc['price'],
          image: doc['title'],
          creatorUID: doc['creatorUID'],
          employeeUID: doc['employeeUID'],
          area: doc['area'],
          phone: doc['phone'],
          address: doc['address'],
          category: doc['category']);
    }).toList();
  }

  // get postings stream
  Stream<QuerySnapshot<Map<String, dynamic>>> get postings {
    return postingCollection.snapshots();
  }

// User
  Future<void> createUserData(String uid,
      {required String email, required bool isEmployee}) async {
    final newUserDoc = await userCollection.doc(uid).set({
      'username': 'default',
      'email': '',
      'isEmployee': isEmployee,
      'bio': '',
      'postings': [],
    });
    return newUserDoc;
  }

  Future<UserData?> getUserData(String uid) async {
    print('This is the use Data');
    final docData = await userCollection.doc(uid).get();
    print('This is the use Data');
    if (docData.exists) {
      if (docData.data() != null) {
        final data = docData.data();
        if (data!.isNotEmpty) {
          return UserData(
              postings: data['postings'],
              uid: data['uid'],
              username: data['username'],
              email: data['email'],
              bio: data['bio'],
              isEmployee: data['isEmployee']);
        }
      }
    }
  }

  Future<void> updateUserData(
      {required String title,
      required String description,
      required String price,
      required String image,
      required String category,
      required String postingUID}) async {
    return await postingCollection.doc(postingUID).update({
      'title': title,
      'description': description,
      'price': price,
      'image': image,
      'category': category,
    });
  }
}
