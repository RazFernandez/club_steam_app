import 'package:firebase_auth/firebase_auth.dart';
import 'package:club_steam_app/utils/Strings.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Verify the account of the user
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

  // Logout the user from the app
  // Logout the user
  Future<void> logoutUser() async {
    await _auth.signOut();
  }
}
