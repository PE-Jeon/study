import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study/datamodels/user.dart';

class FirebaseMethods {
  static final Firestore _firestore = Firestore.instance;

  Future<void> createUserToDb(User user) async {
    _firestore.collection("study_users").document(user.uid).setData(user.toMap(user));
  }
}