import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  late final FirebaseAuth auth;

  AuthService(this.auth);

  Stream<User?> get authStateChanges => auth.idTokenChanges();

  Future<String> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Logged in";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signup(String name, String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(
              () => createUser(name: name, email: email, pass: password));
      return "Signed up";
    } catch (e) {
      return e.toString();
    }
  }

  Future createUser(
      {required String name,
      required String email,
      required String pass}) async {
    final docUser = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid.toString());
    final json = {
      'name': name,
      'email': email,
      'password': pass,
    };
    await docUser.set(json);
  }
}