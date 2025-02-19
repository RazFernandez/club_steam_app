import 'package:firebase_auth/firebase_auth.dart';

//import 'package:club_steam_app/views/home.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //UserCredential? userCredential;
  static User? currentUser;

  // Getter for currentUser
  User? get getCurrenUser {
    return currentUser;
  }

  // Setter for currentUser
  void setCurrentUser() {
    currentUser = _auth.currentUser;
  }

  // Getter for retrieving the UID of currentUser
  String? get currentUserUID {
    return currentUser?.uid;
  }

// This function creates new users
  Future<bool> registerUser(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save the current user logged in
      setCurrentUser();

      return true;
    } catch (e) {
      // Returning false on any exception
      return false;
    }
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

  // Delete a user.
  Future<void> deleteUser() async {
    await currentUser?.delete();
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
