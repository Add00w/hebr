abstract class AuthRepository {
  Future<dynamic> signInWithEmailAndPassword({
    required String username,
    required String password,
    required bool isRemember,
  });
  Future<dynamic> createUserWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required bool agreePolicy,
  });
}
