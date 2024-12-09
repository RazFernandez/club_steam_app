import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club_steam_app/models/user_model.dart';

class UserQueries {
  // Initialize Cloud Firestore and get a reference to the service
  final db = FirebaseFirestore.instance;

  // Add a user to Firestore
  Future<void> addUser(User user) async {
    db.collection("users").add(user.toFirestore());
  }
}
