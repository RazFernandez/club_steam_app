import 'package:firebase_auth/firebase_auth.dart';
import 'package:club_steam_app/utils/strings_app.dart';
import 'package:club_steam_app/utils/strings/FirebaseAuthError.dart';

//import 'package:club_steam_app/views/home.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserCredential userCredential;

  // This function creates new users
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
  Future<bool> signInUsingEmail(
      {required String email, required String password}) async {
    // Try validating the user
    await _auth.signInWithEmailAndPassword(email: email, password: password);
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
