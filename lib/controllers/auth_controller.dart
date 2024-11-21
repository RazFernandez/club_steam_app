import 'package:firebase_auth/firebase_auth.dart';
import 'package:club_steam_app/utils/strings_app.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserCredential userCredential;

  Future<String> registerUser(String email, String password) async {
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return FormFieldMessage.sucessfulRegistration;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return FormFieldMessage
            .existingAccount; // Ensure this constant is defined
      } else {
        return FormFieldMessage
            .errorConnectionFirebase; // Ensure this constant is defined
      }
    } catch (e) {
      return "An unexpected error occurred: ${e.toString()}";
    }
  }

  // Verify the account of the user
  Future<String> loginUserWithPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return FormFieldMessage.successfulLogin;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return FormFieldMessage.wrongEmail;
      } else if (e.code == 'wrong-password') {
        return FormFieldMessage.wrongPaswword;
      } else if (e.code == 'network-request-failed') {
        return FormFieldMessage.noNetworkConnection;
      } else {
        return FormFieldMessage.errorConnectionFirebase;
      }
    }
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
