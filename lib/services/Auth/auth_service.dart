import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:club_steam_app/exceptions/FirebaseAuthException.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  // Method to sign in with email and password
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      // Save the error message to the FirebaseAuthExceptionHandler
      FirebaseAuthExceptionHandler.setRegisterErrorMessage(e.code);
      log("Something went wrong ${e.code}");
    }
    return null;
  }

  ///////
///////
  // add FirebaseAuthExceptionHandler to the login method
///////
//////////
//////////
  ///
  // Method to sign in with email and password
  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong: ${e.toString()}");
    }
    return null;
  }

  // Method to check if an email is validated
  Future<bool> checkEmailVerification() async {
    User? user = _auth.currentUser;

    if (user == null) {
      log("User does not exist");
      return false;
    }

    if (user.emailVerified) {
      log("Email verified");
      return true;
    } else {
      log("Email not verified");
      return false;
    }
  }

  // Method to send email verification
  Future<void> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      await user?.sendEmailVerification();
      log("Verification email sent");
    } catch (e) {
      log("Something went wrong ${e.toString()}");
    }
  }

  // Method to reload user's verification status and related data
  Future<void> reloadUserData() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await user.reload();
      }
    } catch (e) {
      log("Something went wrong ${e.toString()}");
    }
  }

  // add a method to check if the suer is logged in
  bool checkUserLoggedIn() {
    final user = _auth.currentUser;
    if (user != null) {
      log("Account: ${user.email} logged in");
      return true;
    } else {
      return false;
    }
  }

  // Method to sign out
  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Something went wrong: ${e.toString()}");
    }
  }
}
