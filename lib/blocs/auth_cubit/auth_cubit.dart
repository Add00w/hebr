import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AuthCubit extends HydratedCubit<bool> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthCubit() : super(false);
  void init() async {
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        emit(false);
      } else {
        print('User is signed in!');
        emit(true);
      }
    });
  }

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json['isAuthenticated'] as bool;
  }

  @override
  Map<String, dynamic>? toJson(bool isAuthenticated) {
    return {'isAuthenticated': isAuthenticated};
  }
}
