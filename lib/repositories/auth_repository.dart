abstract class AuthRepository {
  Future<void> login({
    required String username,
    required String password,
    required bool isRemember,
  });
  Future<void> signup({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required bool agreePolicy,
  });
}
