import 'package:firebase_auth/firebase_auth.dart';
import 'package:club_steam_app/exceptions/FirebaseAuthError.dart';
import 'package:flutter/foundation.dart';

//import 'package:club_steam_app/views/home.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //UserCredential? userCredential;
  static User? currentUser;

  // Getter for currentUser
  User? getCurrenUser() {
    return currentUser;
  }

  // Setter for currentUser
  void setCurrentUser() {
    currentUser = _auth.currentUser;
  }

  // This function creates new users
  Future<bool> registerUser(
      {required String email, required String password}) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    setCurrentUser();

    return true;
  }

  // Verify the account of the user
  Future<bool> signInUsingEmail(
      {required String email, required String password}) async {
    // Try validating the user
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    setCurrentUser();
    return true;
  }

  // Logout the user
  Future<void> logoutUser() async {
    await _auth.signOut();
  }

  // Correct this properly

  // Verify if the user is currently singed-up
  Future<bool> checkUserLogin() async {
    if (_auth.currentUser != null) {
      return true;
    }
    return false;
  }
}
