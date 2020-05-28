import 'package:study/crud/firebase/firebase_methods.dart';
import 'package:study/datamodels/user.dart';

class FirebaseRepo {
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  Future<void> createUserToDb(User user) =>
      _firebaseMethods.createUserToDb(user);
}