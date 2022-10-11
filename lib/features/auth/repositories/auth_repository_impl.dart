import 'package:firebase_auth/firebase_auth.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final FirestoreService _firestoreService = locator<FirestoreService>();
  // final AnalyticsService _analyticsService = locator<AnalyticsService>();
  @override
  Future<dynamic> signInWithEmailAndPassword(
      {required String username,
      required String password,
      required bool isRemember}) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
        // email: email,
        // password: password,
        email: username,
        password: password,
      );
      return user;
    } catch (e) {
      return e;
    }
    // log('attempting to login');
    // await Future.delayed(Duration(seconds: 2));
    // log('logedin');
  }

  @override
  Future<dynamic> createUserWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required bool agreePolicy,
  }) async {
    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user != null;
    } catch (e) {
      return e;
    }
    // log('attempting to signup');
    // await Future.delayed(Duration(seconds: 2));
    // log('signup succeed');
  }

  @override
  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }
}
