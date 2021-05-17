import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpy/services/database.dart';

class AuthenticationProvider {
  final FirebaseAuth firebaseAuth;

  AuthenticationProvider(this.firebaseAuth);

  Stream<User?> get authState => firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<String> signIn(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'error';
    }
  }

  Future<String> signUp(String email, String password,
      {required isEmployee, }) async {
    try {
      final userCredentials = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCredentials.user != null) {
        await DatabaseService().createUserData(uid: userCredentials.user!.uid,
            email: email, isEmployee: isEmployee);
      }
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'erro';
    }
  }

  Future<String> uid() async {
    return firebaseAuth.currentUser!.uid;
  }
}
