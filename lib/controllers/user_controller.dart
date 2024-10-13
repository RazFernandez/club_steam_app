import 'package:firebase_auth/firebase_auth.dart';
import 'package:club_steam_app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        // Optionally, save user to database or update UserModel
        UserModel newUser = UserModel(uid: user.uid, email: user.email!);
        // Do additional operations like saving to Firestore here

        return true;
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
    return false;
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      return user != null;
    } catch (e) {
      debugPrint("Error: $e");
    }
    return false;
  }

  User? get currentUser => _auth.currentUser;
}
