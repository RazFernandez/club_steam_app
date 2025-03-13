import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  // Method to sign in with email and password
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  // Method to sign in with email and password
  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong");
    }
    return null;
  }

  // Method to send email verification
  Future<void> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      await user?.sendEmailVerification();
    } catch (e) {
      log("Something went wrong");
    }
  }

  // Method to sign out
  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Something went wrong");
    }
  }
}
