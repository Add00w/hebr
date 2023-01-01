import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> signInWithEmailAndPassword({
    required String username,
    required String password,
    required bool isRemember,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: username,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required bool agreePolicy,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }
}
