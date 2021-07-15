import 'dart:developer';

import 'package:hebr/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> login(
      {required String username,
      required String password,
      required bool isRemember}) async {
    log('attempting to login');
    await Future.delayed(Duration(seconds: 2));
    log('logedin');
  }

  @override
  Future<void> signup({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required bool agreePolicy,
  }) async {
    log('attempting to signup');
    await Future.delayed(Duration(seconds: 2));
    log('signup succeed');
  }
}
