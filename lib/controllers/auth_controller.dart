import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:club_steam_app/models/user_model.dart';
import 'package:club_steam_app/utils/Strings.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> loginUserWithPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return LoginMessages.successfulLogin;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return LoginMessages.wrongEmail;
      } else if (e.code == 'wrong-password') {
        return LoginMessages.wrongPaswword;
      } else if (e.code == 'network-request-failed') {
        return LoginMessages.noNetworkConnection;
      } else {
        return LoginMessages.errorConnectionFirebase;
      }
    }
  }
}